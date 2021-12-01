import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/bill_model.dart';
import 'package:sit_eat_web/app/data/model/dashboard_model.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/bill_service.dart';
import 'package:sit_eat_web/app/data/services/reservation_service.dart';
import 'package:sit_eat_web/app/data/services/table_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';

class DashboardController extends GetxController {
  final TableService _tableService = TableService();
  final BillService _billsService = BillService();
  final ReservationService _reservationService = ReservationService();
  final UserService _userService = UserService();

  RxBool isLoading = false.obs;
  RxList<TableModel> tables = <TableModel>[].obs;
  RxList<ReservationModel> reservations = <ReservationModel>[].obs;
  RxList<DashboardModel> dashboards = <DashboardModel>[].obs;

  @override
  void onInit() {
    // TODO: fazer listener das mesas

    //getTables();
    listenTables();
    super.onInit();
  }

  void listenTables() {
    _tableService.listenerTables().listen((tablesDB) {
      for (var table in tablesDB) {
        if (table.reservationId.isBlank != true) {
          addBusyTable(table);
        } else {
          addFreeTable(table);
        }
      }

      listenBills();
    });
  }

  void listenBills() {
    _billsService.listenerBills().listen((bills) async {
      for (var bill in bills) {
        var dashboardModel =
            getExistingTableByReservationId(bill.reservationId!);

        if (dashboardModel == null) continue;
        await updateDashBills(dashboardModel, bill);
      }

      listenReservations();
    });
  }

  void listenReservations() {
    _reservationService.listenerReservations().listen((reservations) async {
      for (var reservation in reservations) {
        var dashboardModel = getExistingTableByReservationId(reservation.id!);
        if (dashboardModel == null) continue;

        await getUserDetails(reservation);
        await updateDashReservations(dashboardModel, reservation);
      }

      dashboards.refresh();
    });
  }

  void addBusyTable(TableModel table) {
    DashboardModel? tableExist = getExistingTable(table.id!);
    if (tableExist == null) {
      dashboards.add(DashboardModel(
        //tables
        tableId: table.id,
        number: table.number,
        busy: table.busy,
        capacity: table.capacity,
        qrCode: table.qrCode,
        reservationId: table.reservationId,
        //reservation
        checkIn: null,
        occupationQty: null,
        restaurantId: null,
        status: ReservationStatus.FINALIZADO,
        userId: "",
        userName: "",
        //bills
        billAsked: false,
        //orders
        newOrders: false,
      ));
    }
  }

  void addFreeTable(TableModel table) {
    DashboardModel? tableExist = getExistingTable(table.id!);
    if (tableExist == null) {
      dashboards.add(DashboardModel(
        //tables
        tableId: table.id,
        number: table.number,
        busy: table.busy,
        capacity: table.capacity,
        qrCode: table.qrCode,
        reservationId: table.reservationId,
        //reservation
        checkIn: null,
        occupationQty: null,
        restaurantId: null,
        status: ReservationStatus.FINALIZADO,
        userId: "",
        userName: "",
        //bills
        billAsked: false,
        paymentType: "",
        //orders
        newOrders: false,
      ));
    }
  }

  DashboardModel? getExistingTable(String tableId) {
    if (dashboards.isEmpty) return null;
    var model = dashboards.where((table) => table.tableId == tableId);
    return model.length > 0 ? model.first : null;
  }

  DashboardModel? getExistingTableByReservationId(String reservationId) {
    if (dashboards.isEmpty) return null;
    var model =
        dashboards.where((table) => table.reservationId == reservationId);
    return model.length > 0 ? model.first : null;
  }

  Future updateDashBills(DashboardModel dashboardModel, BillModel bill) async {
    dashboardModel.billAsked = bill.asked;
    dashboardModel.paymentType = bill.paymentType;
  }

  Future updateDashReservations(
    DashboardModel dashboardModel,
    ReservationModel reservation,
  ) async {
    dashboardModel.checkIn = reservation.checkIn;
    dashboardModel.occupationQty = reservation.occupationQty;
    dashboardModel.restaurantId = reservation.restaurantId;
    dashboardModel.status = reservation.status;
    dashboardModel.userId = reservation.userId;
    dashboardModel.userName = reservation.userName;
  }

  void getTables() async {
    var tables = await _tableService.getTables();
    this.tables.value = sortTables(tables);
    getReservations();
  }

  void getReservations() async {
    var tempReservations = await _reservationService
        .getAll(AuthService.to.user.value.restaurantId!);
    if (tempReservations != null) this.reservations.value = tempReservations;
    mapDashboard();
  }

  void mapDashboard() async {
    List<DashboardModel> dash = <DashboardModel>[];

    for (var table in this.tables.where((t) => t.busy == true)) {
      ReservationModel tempReservation =
          reservations.firstWhere((reserv) => reserv.id == table.reservationId);

      DashboardModel tempDash = DashboardModel(
        reservationId: tempReservation.id,
        restaurantId: tempReservation.restaurantId,
        tableId: table.id,
        busy: table.busy,
        capacity: table.capacity,
        checkIn: tempReservation.checkIn,
        number: table.number,
        occupationQty: tempReservation.occupationQty,
        qrCode: table.qrCode,
        status: tempReservation.status,
        userId: tempReservation.userId,
        userName:
            (await _userService.getAppUserName(tempReservation.userId!)).name,
      );

      dash.add(tempDash);
    }

    this.dashboards.addAll(dash);
    //getUserNames();
  }

  void getUserNames() async {
    for (var item in this.dashboards) {
      item.userName = (await _userService.getAppUserName(item.userId!)).name;
    }
  }

  List<TableModel> sortTables(List<TableModel> tables) {
    tables.sort((a, b) {
      if (a.number! > b.number!) return 1;
      if (a.number! < b.number!) return -1;
      return 0;
    });

    return tables;
  }

  Future getUserDetails(ReservationModel reservation) async {
    var user = await _userService.getAppUserName(reservation.userId!);
    reservation.userName = user.name;
    reservation.userPhone = user.phoneNumber;
  }
}

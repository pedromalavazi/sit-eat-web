import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/bill_model.dart';
import 'package:sit_eat_web/app/data/model/dashboard_model.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';
import 'package:sit_eat_web/app/data/model/order_model.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/bill_service.dart';
import 'package:sit_eat_web/app/data/services/order_service.dart';
import 'package:sit_eat_web/app/data/services/reservation_service.dart';
import 'package:sit_eat_web/app/data/services/table_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';

class DashboardController extends GetxController {
  final TableService _tableService = TableService();
  final BillService _billsService = BillService();
  final ReservationService _reservationService = ReservationService();
  final OrderService _orderService = OrderService();
  final UserService _userService = UserService();

  RxBool isLoading = false.obs;
  RxList<TableModel> tables = <TableModel>[].obs;
  RxList<ReservationModel> reservations = <ReservationModel>[].obs;
  RxList<DashboardModel> dashboards = <DashboardModel>[].obs;
  late String restaurantId;

  @override
  void onInit() {
    this.restaurantId = AuthService.to.user.value.restaurantId!;
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
      dashboards.refresh();
    });
  }

  void listenBills() {
    _billsService.listenerBills().listen((bills) async {
      for (var bill in bills) {
        var dashboardModel = getExistingTableByReservationId(bill.reservationId!);

        if (dashboardModel == null) continue;
        await updateDashBills(dashboardModel, bill);
      }

      listenReservations();
      dashboards.refresh();
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

      listenOrders();
      sortTables(dashboards);
      dashboards.refresh();
    });
  }

  void listenOrders() async {
    var reservationsId = <String>[];
    var reservations = await _reservationService.getAll(restaurantId);

    if (reservations != null) {
      reservations.forEach((reservation) {
        reservationsId.add(reservation.id!);
      });

      _orderService.listenerBills(reservationsId).listen((orders) {
        var orderReservationIdToIgnore = <String>[];
        for (var order in orders) {
          if (orderReservationIdToIgnore.contains(order.reservationId)) continue;

          bool hasNotViewedOrders = hasAnyNotViewedOrders(order.id!, orders);

          var dashboardModel = getExistingTableByReservationId(order.reservationId!);
          if (dashboardModel != null) {
            updateDashOrders(dashboardModel, order);
          }

          if (hasNotViewedOrders) {
            orderReservationIdToIgnore.add(order.reservationId!);
          }
        }

        sortTables(dashboards);
        dashboards.refresh();
      });
    }
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
    } else {
      updateDashTables(tableExist, table);
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
    } else {
      updateDashTables(tableExist, table);
    }
  }

  DashboardModel? getExistingTable(String tableId) {
    if (dashboards.isEmpty) return null;
    var model = dashboards.where((table) => table.tableId == tableId);
    return model.length > 0 ? model.first : null;
  }

  DashboardModel? getExistingTableByReservationId(String reservationId) {
    if (dashboards.isEmpty) return null;
    var model = dashboards.where((table) => table.reservationId == reservationId);
    return model.length > 0 ? model.first : null;
  }

  Future updateDashBills(DashboardModel dashboardModel, BillModel bill) async {
    dashboardModel.billAsked = bill.asked;
    dashboardModel.paymentType = bill.paymentType;
    dashboardModel.total = bill.total;
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

  void updateDashOrders(DashboardModel dashboardModel, OrderModel order) {
    dashboardModel.newOrders = !order.viewed!;
  }

  List<DashboardModel> sortTables(List<DashboardModel> tables) {
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

  bool hasAnyNotViewedOrders(String orderId, List<OrderModel> orders) {
    var currentOrders = orders.where((order) => order.id == orderId);
    if (currentOrders.any((order) => !order.viewed!)) {
      return true;
    }
    return false;
  }

  void updateDashTables(DashboardModel dashboardModel, TableModel table) {
    dashboardModel.busy = table.busy;
    dashboardModel.reservationId = table.reservationId;

    if (((!table.busy!) && table.reservationId.isBlank == true)) {
      clearDashboardFields(dashboardModel);
    }
  }

  void clearDashboardFields(DashboardModel dashboardModel) {
    dashboardModel.billAsked = false;
    dashboardModel.newOrders = false;
    dashboardModel.userName = "";
    dashboardModel.occupationQty = null;
  }
}

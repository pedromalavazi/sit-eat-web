import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/dashboard_model.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/reservation_service.dart';
import 'package:sit_eat_web/app/data/services/table_service.dart';
import 'package:sit_eat_web/app/data/services/user_service.dart';

class DashboardController extends GetxController {
  final TableService _tableService = TableService();
  final ReservationService _reservationService = ReservationService();
  final UserService _userService = UserService();

  RxList<TableModel> tables = <TableModel>[].obs;
  RxList<ReservationModel> reservations = <ReservationModel>[].obs;
  RxList<DashboardModel> dashboardItens = <DashboardModel>[].obs;

  @override
  void onInit() {
    // TODO: fazer listener das mesas

    getTables();
    super.onInit();
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
          reservations.firstWhere((reserv) => reserv.id == table.reservationid);

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

    this.dashboardItens.addAll(dash);
    //getUserNames();
  }

  void getUserNames() async {
    for (var item in this.dashboardItens) {
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
}

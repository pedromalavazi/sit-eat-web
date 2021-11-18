import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';

class WaitingListController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  RxList<ReservationModel> reservations = <ReservationModel>[].obs;

  @override
  void onInit() {
    getQueue();
    super.onInit();
  }

  void getQueue() async {
    this.reservations.value = await _restaurantService
        .getQueueByRestaurantId(AuthService.to.user.value.restaurantId!);
  }
}

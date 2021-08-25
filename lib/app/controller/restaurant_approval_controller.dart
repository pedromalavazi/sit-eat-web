import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';
import 'package:sit_eat_web/utils/web_utils.dart';

class RestaurantApprovalController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  final UtilService _utilService = UtilService();

  String restaurantId = Get.arguments;
  Rx<RestaurantModel> restaurant = RestaurantModel().obs;

  @override
  void onInit() {
    getRestaurant();
    super.onInit();
  }

  void getRestaurant() async {
    restaurant.value = await _restaurantService.getById(restaurantId);
  }

  void approve() async {
    bool success = await _restaurantService.activateRestaurant(restaurantId);

    if (success) {
      Get.back();
      _utilService.showSuccessMessage(
          "Sucesso", "Restaurante ativado com sucesso!.");
    }
  }

  void disapprove() async {
    bool success = await _restaurantService.deactivateRestaurant(restaurantId);

    if (success) {
      Get.back();
      _utilService.showSuccessMessage(
          "Sucesso", "Restaurante desativado com sucesso!.");
    }
  }

  getHour(Timestamp? timestamp) {
    if (timestamp == null) return "";
    return getHourFromTimeStamp(timestamp);
  }
}

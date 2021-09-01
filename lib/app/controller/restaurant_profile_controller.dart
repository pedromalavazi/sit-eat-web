import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/restaurant_service.dart';

class RestaurantProfileController extends GetxController {
  final RestaurantService _restaurantService = RestaurantService();
  Rx<RestaurantModel> restaurant = RestaurantModel().obs;
  RxString valueButton = "Editar".obs;
  RxBool editInfo = false.obs;

  @override
  void onInit() {
    getRestaurant();
    super.onInit();
  }

  void editForm() {
    editInfo.value = true;
  }

  void saveForm() {
    editInfo.value = true;
  }

  void getRestaurant() async {
    String? loggedRestaurant = AuthService.to.user.value.restaurantId;
    if (loggedRestaurant != null) {
      restaurant.value = await _restaurantService.getById(loggedRestaurant);
    }
  }
}

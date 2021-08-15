import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/repository/restaurant_repository.dart';

class RestaurantManagementService extends GetxService {
  final RestaurantRepository _restaurantRepository = RestaurantRepository();

  Future<List<RestaurantModel>> getToManage(
      bool? active, String? restaurantName) async {
    return await _restaurantRepository.getRestaurantToManage(
      active,
      restaurantName,
    );
  }
}

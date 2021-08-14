import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/repository/restaurant_repository.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class RestaurantService extends GetxService {
  RestaurantRepository _restaurantRepository = RestaurantRepository();
  UtilService _utilService = UtilService();

  Future<RestaurantModel?> getById(String restaurantId) async {
    if (restaurantId.isEmpty) {
      return null;
    }

    return await _restaurantRepository.getRestaurant(restaurantId);
  }

  Future<String?> registerNewRestaurant(RestaurantModel resturant) async {
    try {
      if (!isValidRestaurant(resturant)) {
        return null;
      }

      // inserir imagem firestore e salvar o link no banco

      return await _restaurantRepository.registerNewRestaurant(resturant);
    } catch (e) {
      return null;
    }
  }

  bool isValidRestaurant(RestaurantModel restaurant) {
    bool isValid = true;

    if (restaurant.address == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Endereço do restaurante é obrigatório.");
    }

    if (restaurant.openTime == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Horário de abertura é obrigatório.");
    }

    if (restaurant.closeTime == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Horário de fechamento é obrigatório.");
    }

    if (restaurant.capacity == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "A Capacidade do restaurante é obrigatório.");
    }

    if (restaurant.menu == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Menu é obrigatório.");
    }

    if (restaurant.name == null || restaurant.name == "") {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Nome do restaurante é obrigatório.");
    }

    return isValid;
  }
}

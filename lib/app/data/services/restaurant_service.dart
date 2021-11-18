import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/repository/restaurant_repository.dart';
import 'package:sit_eat_web/app/data/services/image_service.dart';
import 'package:sit_eat_web/app/data/services/qr_code_service.dart';
import 'package:sit_eat_web/app/data/services/reservation_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class RestaurantService extends GetxService {
  RestaurantRepository _restaurantRepository = RestaurantRepository();
  ReservationService _reservationService = ReservationService();
  QrCodeService _qrCodeService = QrCodeService();
  ImageService _imageService = ImageService();
  UtilService _utilService = UtilService();

  Future<RestaurantModel> getById(String restaurantId) async {
    if (restaurantId.isEmpty) {
      _utilService.showInformationMessage(
          "Dados inválidos", "Restaurante não encontrado.");
      return RestaurantModel();
    }

    var restaurant = await _restaurantRepository.getRestaurant(restaurantId);

    restaurant.image = await _imageService.downloadRestaurantUrl(
        restaurant.image!, restaurantId);

    return restaurant;
  }

  Stream<List<RestaurantModel>> listenerRestaurants() {
    return _restaurantRepository.listenerRestaurants();
  }

  Future<String?> registerNewRestaurant(RestaurantModel resturant) async {
    if (!isValidRestaurant(resturant)) return null;

    var restaurantId =
        await _restaurantRepository.registerNewRestaurant(resturant);

    if (restaurantId != null) {
      resturant.id = restaurantId;
      await generateQrCode(resturant);
    }

    return restaurantId;
  }

  Future<bool> update(RestaurantModel restaurantUpdate) async {
    if (!isValidId(restaurantUpdate.id)) return false;
    if (!isValidRestaurant(restaurantUpdate)) return false;
    await _restaurantRepository.update(restaurantUpdate);
    return true;
  }

  Future<bool> activateRestaurant(String restaurantId) async {
    if (!isValidId(restaurantId)) {
      return false;
    }
    return await _restaurantRepository.activateRestaurant(restaurantId);
  }

  Future<bool> deactivateRestaurant(String restaurantId) async {
    if (!isValidId(restaurantId)) {
      return false;
    }
    return await _restaurantRepository.deactivateRestaurant(restaurantId);
  }

  Future delete(String restaurantId) async {
    await _restaurantRepository.delete(restaurantId);
  }

  Future<void> generateQrCode(RestaurantModel restaurant) async {
    var qrCode = await _qrCodeService.generateRestaurantQR(restaurant);
    await _restaurantRepository.updateQrCode(restaurant.id!, qrCode);
  }

  Future<List<ReservationModel>> getQueueByRestaurantId(
      String restaurantId) async {
    List<ReservationModel> reservationsQueue = <ReservationModel>[];

    try {
      if (!isValidId(restaurantId)) return <ReservationModel>[];
      var queues =
          await _restaurantRepository.getQueueByRestaurantId(restaurantId);

      for (var queue in queues) {
        var reservation =
            await _reservationService.getReservationById(queue.reservationId);

        reservationsQueue.add(reservation);
      }

      return reservationsQueue;
    } catch (e) {
      return reservationsQueue;
    }
  }

  bool isValidId(String? id) {
    if (id.isBlank == true) {
      _utilService.showInformationMessage(
          "Dados inválidos", "Id do restaurante inválido.");
      return false;
    }
    return true;
  }

  bool isValidRestaurant(RestaurantModel restaurant) {
    bool isValid = true;

    if (restaurant.address == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Endereço é obrigatório.");
    }

    if (restaurant.number == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Número é obrigatório.");
    }

    if (restaurant.zipCode == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "CEP é obrigatório.");
    }

    if (restaurant.state == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Estado é obrigatório.");
    }

    if (restaurant.city == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Cidade é obrigatório.");
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

    if (restaurant.name == null || restaurant.name == "") {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Nome do restaurante é obrigatório.");
    }

    return isValid;
  }
}

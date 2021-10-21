// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ImageService extends GetxService {
  final UtilService _utilService = UtilService();
  var storage = FirebaseStorage.instance;

  final String? loggedRestaurantId = AuthService.to.user.value.restaurantId;
  final String restaurantURL = 'gs://sit-eat-84d56.appspot.com/restaurants';
  final String productURL = 'gs://sit-eat-84d56.appspot.com/products';
  final String defaultImage = 'default.png';

  Future<String> downloadRestaurantUrl(String photoUrl, String? restaurantId) async {
    String image;
    try {
      if (restaurantId == null) restaurantId = loggedRestaurantId;

      image = await storage.refFromURL('$restaurantURL/$restaurantId').child(photoUrl).getDownloadURL();
    } catch (e) {
      image = await storage.refFromURL('$restaurantURL').child(defaultImage).getDownloadURL();
    }
    return image;
  }

  Future<String> downloadProductUrl(String photoUrl, String? restaurantId) async {
    String image;
    try {
      if (restaurantId == null) restaurantId = loggedRestaurantId;

      image = await storage.refFromURL('$productURL/$restaurantId').child(photoUrl).getDownloadURL();
    } catch (e) {
      image = await storage.refFromURL('$productURL').child(defaultImage).getDownloadURL();
    }
    return image;
  }

  Future<bool> uploadRestaurantImage(File data) async {
    try {
      await storage.refFromURL('$restaurantURL/$loggedRestaurantId').child(data.name).putBlob(data);

      return true;
    } catch (e) {
      _utilService.showErrorMessage("Erro", "Erro ao salvar a imagem.");
      return false;
    }
  }

  Future<bool> uploadProductImage(File data) async {
    try {
      await storage.refFromURL('$productURL/$loggedRestaurantId').child(data.name).putBlob(data);

      return true;
    } catch (e) {
      _utilService.showErrorMessage("Erro", "Erro ao salvar a imagem.");
      return false;
    }
  }
}

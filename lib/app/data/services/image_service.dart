import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';

class ImageService extends GetxService {
  var storage = FirebaseStorage.instance;

  final String restaurantURL = 'gs://sit-eat-84d56.appspot.com/restaurants';
  final String productURL = 'gs://sit-eat-84d56.appspot.com/products';

  Future<String> downloadRestaurantUrl(String photoUrl) async {
    var image = await storage
        .refFromURL(restaurantURL)
        .child(photoUrl)
        .getDownloadURL();

    return image;
  }

  Future<String> downloadProductUrl(String photoUrl) async {
    var image =
        await storage.refFromURL(productURL).child(photoUrl).getDownloadURL();

    return image;
  }

  Future<String> uploadRestaurantImage(File data) async {
    var name = data.name;
    var restaurantId = AuthService.to.user.value.restaurantId!;
    String path = '$name-$restaurantId';

    await storage.refFromURL(restaurantURL).child(path).putBlob(data);

    return path;
  }
}

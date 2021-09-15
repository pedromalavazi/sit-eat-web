import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ImageService extends GetxService {
  var storage = FirebaseStorage.instance;

  Future<String> downloadUrl(String photoUrl) async {
    var teste = storage
        .refFromURL('gs://sit-eat-84d56.appspot.com/restaurants')
        .child('madero.png')
        .getDownloadURL();

    return await teste;
  }
}

import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/services/image_service.dart';

class HomeController extends GetxController {
  final ImageService imageService = ImageService();

  RxString image = "".obs;

  @override
  void onInit() async {
    await testeImage();
    super.onInit();
  }

  Future<void> testeImage() async {
    image.value = await imageService.downloadUrl("photoUrl");
  }
}

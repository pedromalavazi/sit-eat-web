import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart';
import 'package:sit_eat_web/app/data/model/restaurant_model.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/model/qr_code_model.dart';
import 'package:sit_eat_web/app/data/model/enum/qr_code_type_enum.dart';
import 'package:sit_eat_web/app/data/repository/qr_code_repository.dart';

class QrCodeService extends GetxService {
  final QrCodeRepository _qrCodeRepository = QrCodeRepository();

  Future<QrCodeModel?> getByQrCode(String qrCode) async {
    if (qrCode.isBlank == true) return null;

    var qrCodeModel = await _qrCodeRepository.getByQrCode(qrCode);

    return qrCodeModel;
  }

  Future<String> generateTableQR(String restaurantId, TableModel table) async {
    final textToEncrypt = restaurantId + table.number.toString();

    Encrypted encriptedQRCode = encrypt(textToEncrypt);

    var qrCodeModel = QrCodeModel(
      qrCode: encriptedQRCode.base16,
      referenceId: table.id,
      type: QrCodeType.TABLE,
    );

    await _qrCodeRepository.generateQRCode(qrCodeModel);

    return encriptedQRCode.base16;
  }

  Future<String> generateRestaurantQR(RestaurantModel restaurant) async {
    final textToEncrypt = restaurant.id! + restaurant.name!;

    Encrypted encriptedQRCode = encrypt(textToEncrypt);

    var qrCodeModel = QrCodeModel(
      qrCode: encriptedQRCode.base16,
      referenceId: restaurant.id,
      type: QrCodeType.RESTAURANT,
    );

    await _qrCodeRepository.generateQRCode(qrCodeModel);

    return encriptedQRCode.base16;
  }

  Encrypted encrypt(String decriptedText) {
    final Key key = Key.fromLength(32);
    final IV iv = IV.fromLength(16);
    final Encrypter encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(decriptedText, iv: iv);

    return encrypted;
  }
}

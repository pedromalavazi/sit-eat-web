import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/enum/login_status_enum.dart';
import 'package:sit_eat_web/app/data/model/user_firebase_model.dart';
import 'package:sit_eat_web/app/data/model/user_model%20copy.dart';
import 'package:sit_eat_web/app/data/model/user_web_model.dart';
import 'package:sit_eat_web/app/data/repository/user_repository.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class UserService extends GetxService {
  final UserRepository _userRepository = UserRepository();
  final UtilService _utilService = UtilService();

  Future<UserWebModel> get(String id) {
    return _userRepository.getUser(id);
  }

  Future<UserModel> getAppUserName(String id) async {
    return await _userRepository.getAppUserName(id);
  }

  Future<bool> createRestaurantUser(
    String email,
    String password,
    String confirmPassword,
    String name,
    String restaurantId,
  ) async {
    if (!isValidPasswords(password, confirmPassword)) return false;

    var user = UserWebModel(
      email: email,
      name: name,
      restaurantId: restaurantId,
    );

    return await AuthService.to.createRestaurantUser(
      user,
      password,
      confirmPassword,
    );
  }

  Future<void> updateUser(
    UserWebModel user,
    String password,
    String confirmPassword,
  ) async {
    await updateUserPassword(password, confirmPassword);

    var newFirebaseUser = await updateUserName(user.name);

    if (newFirebaseUser != null) {
      await _userRepository.updateUser(user);
    }
  }

  Future<bool> updateUserPassword(
    String password,
    String confirmPassword,
  ) async {
    if (!isValidPasswords(password, confirmPassword)) return false;

    return AuthService.to.updateUserPassword(password);
  }

  Future<UserFirebaseModel?> updateUserName(String? userName) async {
    if (userName == null) return null;
    return await AuthService.to.updateUserName(userName);
  }

  void updateUserStatus(String userId, LoginStatus status) async {
    await _userRepository.updateUserStatus(userId, status);
  }

  Future delete(String? id) async {
    await _userRepository.delete(id);
  }

  bool isValidPasswords(String password, String confirmPassword) {
    bool isValidPass = true;

    if (password.isBlank == true || confirmPassword.isBlank == true) {
      isValidPass = false;
    }

    if (password != confirmPassword) {
      isValidPass = false;
    }

    if (!isValidPass)
      _utilService.showErrorMessage(
          "Dados inválidos", "A senha e a confirmação de senha não conferem.");

    return isValidPass;
  }
}

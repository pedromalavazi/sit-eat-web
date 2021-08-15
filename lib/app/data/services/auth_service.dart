import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/enum/login_type_enum.dart';
import 'package:sit_eat_web/app/data/model/user_firebase_model.dart';
import 'package:sit_eat_web/app/data/model/user_model.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class AuthService extends GetxController {
  final UtilService _util = UtilService();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  late Rx<UserModel> _user;
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();

    _firebaseUser = Rx<User?>(_auth.currentUser);
    _user = Rx<UserModel>(UserModel());
    _firebaseUser.bindStream(_auth.authStateChanges());

    ever(_firebaseUser, (User? user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  @override
  void onClose() {}

  User? get firebaseUser => _firebaseUser.value;
  Rx<UserModel> get user => _user;
  static AuthService get to => Get.find<AuthService>();

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> login(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _user.value = UserModel.fromSnapshot(
        await _firestore.collection("users").doc(user.user?.uid).get(),
      );

      if (_user.value.type != LoginType.RESTAURANT) {
        resetUser();
        _util.showErrorMessage(
          "Usuário inválido",
          "Usuário sem permissão para logar no site",
        );
        return false;
      }

      _user.value.id = user.user?.uid;
      return true;
    } catch (e) {
      throwErrorMessage(e);
      return false;
    }
  }

  Future<bool> createRestaurantUser(
    String email,
    String password,
    String confirmPassword,
    String name,
    String restaurantId,
  ) async {
    try {
      //Cria usuário do Firebase
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Atualizando o nome do usuário
      await _firebaseUser.value?.updateDisplayName(name);
      await _firebaseUser.value?.reload();

      //Cria usuário de controle do app
      await _firestore.collection("users").doc(_firebaseUser.value?.uid).set({
        "email": email,
        "name": name,
        "restaurantId": restaurantId,
        "type": LoginType.RESTAURANT.toUpper,
      });
      return true;
    } catch (e) {
      throwErrorMessage(e);
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.back();
      _util.showInformationMessage("Aviso", "E-mail enviado");
      return true;
    } catch (e) {
      throwErrorMessage(e);
      return false;
    }
  }

  Future<UserFirebaseModel?> updateUserName(String userName) async {
    try {
      await _auth.currentUser?.updateDisplayName(userName);
      await _auth.currentUser?.reload();
      return UserFirebaseModel.fromSnapshot(_auth.currentUser);
    } catch (e) {
      throwErrorMessage(e);
      return null;
    }
  }

  Future<UserFirebaseModel> updateUserPassword(String password) async {
    try {
      await _auth.currentUser?.updatePassword(password);
      await _auth.currentUser?.reload();
      return UserFirebaseModel.fromSnapshot(_auth.currentUser);
    } catch (e) {
      throwErrorMessage(e);
      return UserFirebaseModel();
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _util.showErrorMessage('Erro ao sair!', "Erro na tentativa de logout.");
    }
  }

  void resetUser() {
    _user.value = UserModel();
    _auth.signOut();
  }

  throwErrorMessage(dynamic error) {
    switch (error.code) {
      case "user-not-found":
        _util.showErrorMessage("Erro", "Usuário não encontrado.");
        break;
      case "wrong-password":
        _util.showErrorMessage("Erro", "Usuário ou senha incorreta.");
        break;
      case "operation-not-allowed":
        _util.showErrorMessage("Erro", "Login não permitido.");
        break;
      case "invalid-password":
        _util.showErrorMessage(
            "Erro", "Senha fraca. É necessário seis caracteres.");
        break;
      case "invalid-email":
        _util.showErrorMessage("Erro", "E-mail é inválido.");
        break;
      case "email-already-exists":
        _util.showErrorMessage("Erro", "E-mail já cadastrado.");
        break;
      case "invalid-credential":
        _util.showErrorMessage("Erro", "Email inválido.");
        break;
      default:
        _util.showErrorMessage(
          "Erro",
          "Erro desconhecido, tente novamente mais tarde ou entre em contato com nosso e-mail: appsiteat@gmail.com",
        );
    }
  }
}

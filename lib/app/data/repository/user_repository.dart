import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/user_model.dart';

class UserRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Cria usuáio
  Future<bool> createUser(String id, String email, String name) async {
    try {
      await _firestore.collection("usersWeb").doc(id).set({
        "email": email,
        "name": name,
      });

      return true;
    } catch (e) {
      print(e);
      Get.back();
      Get.defaultDialog(
          title: "ERROR", content: Text("Usuário não encontrado."));
      return false;
    }
  }

  // Consulta usuáio
  Future<UserWebModel> getUser(String id) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("usersWeb").doc(id).get();
      UserWebModel user = UserWebModel.fromSnapshot(doc);
      user.id = id;
      return user;
    } catch (e) {
      print(e);
      Get.back();
      Get.defaultDialog(
          title: "ERROR", content: Text("Usuário não encontrado."));
      return UserWebModel();
    }
  }

  Future<void> updateUser(UserWebModel user) async {
    try {
      await _firestore.collection("usersWeb").doc(user.id).update({
        "name": user.name,
      });
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR",
          content: Text("Não foi possível atualizar os dados."));
    }
  }

  Future delete(String? id) async {
    await _firestore.collection("usersWeb").doc(id).delete();
  }
}

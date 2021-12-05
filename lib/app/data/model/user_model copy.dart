import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/enum/login_status_enum.dart';
import 'package:sit_eat_web/app/data/model/enum/login_type_enum.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? tokenMessage;
  String? image;
  LoginType? type;
  LoginStatus? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.tokenMessage,
    this.image,
    this.type,
    this.status,
  });

  UserModel.fromSnapshot(DocumentSnapshot currentUser)
      : id = currentUser.id,
        name = currentUser["name"],
        email = currentUser["email"],
        phoneNumber = currentUser["phoneNumber"],
        tokenMessage = currentUser["tokenMessage"],
        image = currentUser["image"],
        type = LoginType.values
            .where((type) => type.toUpper == currentUser["type"])
            .first,
        status = LoginStatus.values
            .where((status) => status.toUpper == currentUser["status"])
            .first;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "tokenMessage": tokenMessage,
      "type": type,
      "image": image,
      "status": status
    };
  }
}

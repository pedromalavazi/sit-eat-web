import 'package:cloud_firestore/cloud_firestore.dart';
import 'enum/login_status_enum.dart';
import 'enum/login_type_enum.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? tokenMessage;
  String? restaurantId;
  LoginType? type;
  LoginStatus? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.tokenMessage,
    this.restaurantId,
    this.type,
    this.status,
  });

  UserModel.fromSnapshot(DocumentSnapshot currentUser)
      : id = currentUser.id,
        name = currentUser["name"],
        email = currentUser["email"],
        phoneNumber = currentUser["phoneNumber"],
        tokenMessage = currentUser["tokenMessage"],
        restaurantId = currentUser["restaurantId"],
        type = LoginType.values
            .where((type) => type.toUpper == currentUser["type"])
            .first,
        status = LoginStatus.values
            .where((status) => status.toUpper == currentUser["status"])
            .first;
}

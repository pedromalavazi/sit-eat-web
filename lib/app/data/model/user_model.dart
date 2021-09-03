import 'package:cloud_firestore/cloud_firestore.dart';
import 'enum/login_type_enum.dart';

class UserWebModel {
  String? id;
  String? name;
  String? email;
  String? restaurantId;
  LoginType? type;

  UserWebModel({
    this.id,
    this.name,
    this.email,
    this.restaurantId,
    this.type,
  });

  UserWebModel.fromSnapshot(DocumentSnapshot currentUser)
      : id = currentUser.id,
        name = currentUser["name"],
        email = currentUser["email"],
        restaurantId = currentUser["restaurantId"],
        type = LoginType.values
            .where((type) => type.toUpper == currentUser["type"])
            .first;
}

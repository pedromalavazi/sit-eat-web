import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/reservation_model.dart';

class WaitingListController extends GetxController {
  RxList<ReservationModel> reservations = <ReservationModel>[].obs;

  // void getUsers() {
  //   nameTextController:
  //   _userService.get(name);
  // }
}

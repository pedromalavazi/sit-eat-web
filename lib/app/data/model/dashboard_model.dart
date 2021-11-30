import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/enum/reservation_status_enum.dart';

class DashboardModel {
  String? tableId;
  bool? busy;
  int? capacity;
  int? number;
  String? qrCode;
  String? reservationId;
  Timestamp? checkIn;
  int? occupationQty;
  String? restaurantId;
  ReservationStatus? status;
  String? userId;
  String? userName;
  bool? billAsked;
  bool? newOrders;
  String? paymentType;

  DashboardModel({
    this.tableId,
    this.busy,
    this.capacity,
    this.number,
    this.qrCode,
    this.reservationId,
    this.checkIn,
    this.occupationQty,
    this.restaurantId,
    this.status,
    this.userId,
    this.userName,
    this.billAsked,
    this.newOrders,
    this.paymentType,
  });
}

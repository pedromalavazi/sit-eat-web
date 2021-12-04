import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/order_model.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class OrderRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UtilService _utilService = UtilService();

  Future<OrderModel> getById(String orderId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("orders").doc(orderId).get();
      OrderModel restaurant = OrderModel.fromSnapshot(doc);
      return restaurant;
    } catch (e) {
      _utilService.showInformationMessage(
          "Não encontrado", "Pedido não encontrado.");
      return OrderModel();
    }
  }

  Future<List<OrderModel>> getOrders(String reservationId) async {
    List<OrderModel> orders = <OrderModel>[];
    try {
      var productsDocs = await _firestore
          .collection("orders")
          .where('reservationId', isEqualTo: reservationId)
          .get();

      if (productsDocs.docs.isEmpty) return orders;

      productsDocs.docs.forEach((productDoc) {
        orders.add(OrderModel.fromSnapshot(productDoc));
      });

      return orders;
    } catch (e) {
      _utilService.showInformationMessage(
          "Não encontrado", "Pedidos não encontrado.");
      return orders;
    }
  }

  Future<bool> changeDelivered(String orderId, bool delivered) async {
    try {
      await _firestore
          .collection('orders')
          .doc(orderId)
          .update({"delivered": delivered});
      return true;
    } catch (e) {
      _utilService.showInformationMessage(
          "Erro", "Erro ao mudar status do pedido.");
      return false;
    }
  }

  Stream<List<OrderModel>> listenerOrders(List<String> reservationId) {
    try {
      return _firestore
          .collection("orders")
          .where("reservationId", whereIn: reservationId)
          .snapshots()
          .map((doc) {
        if (doc.docs.length == 0) {
          return <OrderModel>[];
        }
        return convertOrdersFromDB(doc);
      });
    } catch (e) {
      return Stream.empty();
    }
  }

  List<OrderModel> convertOrdersFromDB(QuerySnapshot orderFromDB) {
    List<OrderModel> orders = <OrderModel>[];
    orderFromDB.docs.forEach((order) {
      orders.add(OrderModel.fromSnapshot(order));
    });

    return orders;
  }

  Future<bool> setViewed(String reservationId) async {
    try {
      _firestore
          .collection("orders")
          .where("reservationId", isEqualTo: reservationId)
          .snapshots()
          .map((doc) {
        if (doc.docs.length == 0) {
          return <OrderModel>[];
        }
        doc.docs.forEach((orderFromDB) {
          var tempOrder = OrderModel.fromSnapshot(orderFromDB);
          _firestore
              .collection("orders")
              .doc(tempOrder.id)
              .update({"viewed": true});
        });
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}

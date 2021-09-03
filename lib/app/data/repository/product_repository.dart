import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';

class ProductRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProductModel> getProduct(String productId, String restaurantId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("products").doc(productId).get();
      ProductModel restaurant = ProductModel.fromSnapshot(doc);
      return restaurant;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Produtos não encontrado."));
      return ProductModel();
    }
  }

  Future<List<ProductModel>> getProducts(String restaurantId) async {
    List<ProductModel> tables = <ProductModel>[];
    try {
      var productsDocs = await _firestore
          .collection("products")
          .where('restaurantId', isEqualTo: restaurantId)
          .get();
      if (productsDocs.docs.isEmpty) return tables;

      productsDocs.docs.forEach((productDoc) {
        tables.add(ProductModel.fromSnapshot(productDoc));
      });

      return tables;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Produtos não encontradas."));
      return tables;
    }
  }

  Future<String?> register(ProductModel newProduct, String restaurantId) async {
    try {
      var reservationId = await _firestore.collection("products").add(
        {
          "name": newProduct.name,
          "image": " ",
          "price": newProduct.price,
          "description": newProduct.description,
          "restaurantId": restaurantId,
        },
      );

      return reservationId.id;
    } catch (e) {
      Get.defaultDialog(
          title: "ERROR", content: Text("Erro ao cadastrar produto."));
      return null;
    }
  }
}

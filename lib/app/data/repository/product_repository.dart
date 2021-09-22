import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ProductRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UtilService _utilService = UtilService();

  Future<ProductModel> getProduct(String productId, String restaurantId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("products").doc(productId).get();
      ProductModel restaurant = ProductModel.fromSnapshot(doc);
      return restaurant;
    } catch (e) {
      _utilService.showInformationMessage(
          "Não encontrado", "Produtos não encontrado.");
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
      _utilService.showInformationMessage(
          "Não encontrado", "Produtos não encontrado.");
      return tables;
    }
  }

  Future<String?> register(ProductModel newProduct, String restaurantId) async {
    try {
      var reservationId = await _firestore.collection("products").add(
        {
          "name": newProduct.name,
          "image": newProduct.image,
          "price": newProduct.price,
          "description": newProduct.description,
          "measure": newProduct.measure,
          "restaurantId": restaurantId,
        },
      );

      return reservationId.id;
    } catch (e) {
      _utilService.showErrorMessage("Erro", "Erro ao cadastrar produto.");
      return null;
    }
  }

  Future<bool> delete(String productId, String restaurantId) async {
    try {
      await _firestore.collection("products").doc(productId).delete();
      return true;
    } catch (e) {
      _utilService.showErrorMessage(
          "Erro", "Não foi possível excluir o produto.");
      return false;
    }
  }
}

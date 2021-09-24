import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/product_model.dart';
import 'package:sit_eat_web/app/data/repository/product_repository.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/image_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class ProductService extends GetxService {
  ProductRepository _productRepository = ProductRepository();
  UtilService _utilService = UtilService();
  final ImageService _imageService = ImageService();

  Future<ProductModel> getById(String? productId) async {
    if (!isValidId(productId) ||
        !isValidId(AuthService.to.user.value.restaurantId)) {
      _utilService.showInformationMessage(
          "Dados inválidos", "Produto não encontrada.");
      return ProductModel();
    }

    return await _productRepository.getProduct(
        productId!, AuthService.to.user.value.restaurantId!);
  }

  Future<List<ProductModel>> getProducts() async {
    String? restaurantId = AuthService.to.user.value.restaurantId;
    if (!isValidId(restaurantId)) return <ProductModel>[];

    var products = await _productRepository
        .getProducts(AuthService.to.user.value.restaurantId!);

    for (var i = 0; i < products.length; i++) {
      if (products[i].image != null) {
        products[i].image = await _imageService.downloadProductUrl(
          products[i].image!,
          restaurantId,
        );
      }
    }

    return products;
  }

  Future<String?> register(ProductModel product) async {
    try {
      if (!isValidProduct(product)) return null;

      return await _productRepository.register(
          product, AuthService.to.user.value.restaurantId!);
    } catch (e) {
      return null;
    }
  }

  Future<bool> delete(String? tableId) async {
    try {
      return await _productRepository.delete(
          tableId!, AuthService.to.user.value.restaurantId!);
    } catch (e) {
      return false;
    }
  }

  bool isValidId(String? id) {
    if (id.isBlank == true) {
      _utilService.showInformationMessage("Dados inválidos", "Id inválido.");
      return false;
    }
    return true;
  }

  bool isValidProduct(ProductModel table) {
    bool isValid = true;

    if (table.name == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Nome do produto é obrigatório.");
    }

    if (table.description == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Descrição do produto é obrigatório.");
    }

    if (table.price == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Preço do produto é obrigatório.");
    }

    return isValid;
  }
}

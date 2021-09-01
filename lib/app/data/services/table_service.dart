import 'package:get/get.dart';
import 'package:sit_eat_web/app/data/model/table_model.dart';
import 'package:sit_eat_web/app/data/repository/table_repository.dart';
import 'package:sit_eat_web/app/data/services/auth_service.dart';
import 'package:sit_eat_web/app/data/services/util_service.dart';

class TableService extends GetxService {
  TableRepository _tableRepository = TableRepository();
  UtilService _utilService = UtilService();

  Future<TableModel> getById(String tableId) async {
    if (tableId.isEmpty || !isValidId(AuthService.to.user.value.restaurantId)) {
      _utilService.showInformationMessage(
          "Dados inválidos", "Mesa não encontrada.");
      return TableModel();
    }

    return await _tableRepository.getTable(
        tableId, AuthService.to.user.value.restaurantId!);
  }

  Future<List<TableModel>> getTables() async {
    if (!isValidId(AuthService.to.user.value.restaurantId))
      return <TableModel>[];
    return await _tableRepository
        .getTables(AuthService.to.user.value.restaurantId!);
  }

  Future<String?> register(TableModel table) async {
    try {
      if (!isValidTable(table)) {
        return null;
      }

      return await _tableRepository.register(
          table, AuthService.to.user.value.restaurantId!);
    } catch (e) {
      return null;
    }
  }

  Future<bool> delete(String? tableId) async {
    try {
      if (await isTableBusy(tableId)) {
        return false;
      }

      return await _tableRepository.delete(
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

  bool isValidTable(TableModel table) {
    bool isValid = true;

    if (table.number == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Número da mesa é obrigatório.");
    }

    if (table.capacity == null) {
      isValid = false;
      _utilService.showInformationMessage(
          "Dados inválidos", "Capacidade da mesa é obrigatório.");
    }

    return isValid;
  }

  Future<bool> isTableBusy(String? tableId) async {
    bool isValid = false;

    if (isValidId(tableId)) {
      var table = await getById(tableId!);

      if (table.busy == null || table.busy!) {
        isValid = true;
      }
    } else {
      isValid = true;
    }

    if (isValid) {
      _utilService.showInformationMessage(
          "Não permitido", "A mesa está ocupada no momento.");
    }

    return isValid;
  }
}

import '../../models/budget_dto.dart';
import '../boxes.dart';

class BudgetDataSource {
  static List<BudgetDTO> getListBudgetDTO() {
    List<BudgetDTO> listBudgetDTO = [];
    try {
      final box = Boxes.getBoxBudgetDTO();
      listBudgetDTO = box.values.toList();
      return listBudgetDTO;
    } on Exception catch (err) {
      return listBudgetDTO;
    }
  }

  static bool deleteBudgetDTO(String uniqueKey) {
    try {
      final box = Boxes.getBoxBudgetDTO();
      int index = box.values
          .toList()
          .indexWhere((element) => element.uniqueKey == uniqueKey);
      box.deleteAt(index);
      return true;
    } on Exception catch (err) {
      return false;
    }
  }
}

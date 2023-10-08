import 'dart:ui';

import 'package:happy_money/data/hive_service/data_source/transaction_data_source.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';

import '../../models/category_dto.dart';
import '../boxes.dart';
import '../service/category_dto_hive.dart';

class CategoryDataSource {
  static List<CategoryDTO> getListCategoryDTO() {
    List<CategoryDTO> listCategoryDTO = [];
    try {
      final box = Boxes.getBoxCategoryDTO();
      listCategoryDTO = box.values.toList();
      return listCategoryDTO;
    } on Exception catch (err) {
      return listCategoryDTO;
    }
  }

  static bool deleteCategoryDTO(String uniqueKey) {
    try {
      final box = Boxes.getBoxCategoryDTO();
      int index = box.values
          .toList()
          .indexWhere((element) => element.uniqueKey == uniqueKey);

      final boxTran = Boxes.getBoxTransactionDTO();
      List<TransactionDTO> listTran = boxTran.values
          .toList()
          .where((element) => element.category!.uniqueKey == uniqueKey)
          .toList();

      listTran.forEach((tran) {
        TransactionDataSource.deleteTransactionDTO(tran.uniqueKey);
      });

      box.deleteAt(index);
      return true;
    } on Exception catch (err) {
      return false;
    }
  }

  static bool editCategoryDTO(CategoryDTO categoryDTO) {
    try {
      final box = Boxes.getBoxCategoryDTO();
      int index = box.values
          .toList()
          .indexWhere((element) => element.uniqueKey == categoryDTO.uniqueKey);
      box.putAt(index, categoryDTO);
      return true;
    } on Exception catch (err) {
      return false;
    }
  }

  static bool addCategoryDTO(String name, Color color, bool isSpending) {
    try {
      CategoryDTOHive.addCategoryDTO(
        name: name,
        color: color,
        isSpending: isSpending,
      );

      return true;
    } on Exception catch (err) {
      return false;
    }
  }
}

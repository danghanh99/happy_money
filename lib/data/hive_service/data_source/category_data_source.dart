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

  static bool addCategoryDTO(
      String name, Color color, bool isSpending, String iconPath) {
    try {
      CategoryDTOHive.addCategoryDTO(
        iconPath: iconPath,
        name: name,
        color: color,
        isSpending: isSpending,
      );

      return true;
    } on Exception catch (err) {
      return false;
    }
  }

  static int getUsedOfCategory(
      String uniqueKey, DateTime fromDate, DateTime toDate) {
    try {
      int count = 0;
      final box = Boxes.getBoxCategoryDTO();
      int index = box.values
          .toList()
          .indexWhere((element) => element.uniqueKey == uniqueKey);

      if (index >= 0) {
        final boxTrans = Boxes.getBoxTransactionDTO();

        List<TransactionDTO> list = boxTrans.values
            .where((element) =>
                element.uniqueKey == uniqueKey &&
                    element.createdAt!.isAfter(fromDate) &&
                    element.createdAt!.isBefore(toDate) ||
                element.createdAt!.isAtSameMomentAs(fromDate) ||
                element.createdAt!.isAtSameMomentAs(toDate))
            .toList();

        list.forEach((element) {
          if (element.amount != null) {
            count = count + element.amount!;
          }
        });

        return count;
      } else {
        return 0;
      }
    } on Exception catch (err) {
      return 0;
    }
  }
}

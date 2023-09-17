import 'dart:ui';
import 'package:happy_money/data/hive_service/service/hive_service.dart';
import 'package:uuid/uuid.dart';

import '../../models/category_dto.dart';
import '../boxes.dart';

class CategoryDTOHive {
  static Future<int> addCategoryDTO({
    required String name,
    String? iconPath,
    required Color color,
    required bool isSpending,
  }) async {
    final box = Boxes.getBoxCategoryDTO();
    box.values.forEach((element) {});

    final categoryDTO = CategoryDTO(
      name: name,
      iconPath: iconPath,
      colorValue: color.value,
      isSpending: isSpending,
      uniqueKey: generateUnikeyCategory(),
    );
    box.add(categoryDTO);
    return 1;
  }

  static String generateUnikeyCategory() {
    final box = Boxes.getBoxCategoryDTO();
    String uniqueKey = HiveService().generateUniquekey(box);
    return uniqueKey;
  }
}

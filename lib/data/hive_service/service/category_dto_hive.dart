import 'dart:ui';

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
    final categoryDTO = CategoryDTO(
      name: name,
      iconPath: iconPath,
      colorValue: color.value,
      isSpending: isSpending,
    );
    box.add(categoryDTO);
    return 1;
  }
}

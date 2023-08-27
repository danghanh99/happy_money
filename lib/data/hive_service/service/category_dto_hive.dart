import '../../models/category_dto.dart';
import '../boxes.dart';

class CategoryDTOHive {
  static Future<int> addCategoryDTO({
    required String name,
    String? iconPath,
  }) async {
    final box = Boxes.getBoxCategoryDTO();
    final categoryDTO = CategoryDTO(
      name: name,
      iconPath: iconPath,
    );
    box.add(categoryDTO);
    return 1;
  }
}

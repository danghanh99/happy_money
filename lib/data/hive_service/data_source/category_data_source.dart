import '../../models/category_dto.dart';
import '../boxes.dart';

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
}

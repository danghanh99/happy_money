// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:meditation_theme/meditation_theme.dart';

import 'package:happy_money/data/models/category_dto.dart';
import 'package:hive/hive.dart';

import '../models/wallet_dto.dart';

class Boxes {
  void box() {}
  static Box<WalletDTO> getBoxWalletDTO() =>
      Hive.box<WalletDTO>('WalletDTOBox');
  static Box<CategoryDTO> getBoxCategoryDTO() =>
      Hive.box<CategoryDTO>('CategoryDTOBox');
}

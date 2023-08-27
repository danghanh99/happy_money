import 'package:happy_money/data/hive_service/service/category_dto_hive.dart';
import 'package:happy_money/data/hive_service/service/wallet_dto_hive.dart';
import 'package:happy_money/data/models/category_dto.dart';
import 'package:happy_money/data/models/wallet_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data_source/wallet_data_source.dart';

class HiveService {
  Future<void> registerAdapterHive() async {
    Hive.registerAdapter(WalletDTOAdapter());
    Hive.registerAdapter(CategoryDTOAdapter());
  }

  Future<void> openBoxHive() async {
    await Hive.openBox<WalletDTO>('WalletDTOBox');
    await Hive.openBox<CategoryDTO>('CategoryDTOBox');
  }

  void seedHive() {
    if (WalletDataSource.getListWalletDTO().isEmpty) {
      WalletDTOHive.addWalletDTO(
        name: 'Cash',
        isMainWallet: true,
      );

      WalletDTOHive.addWalletDTO(
        name: 'Mizuho',
        isMainWallet: false,
      );

      CategoryDTOHive.addCategoryDTO(name: "Food");
      CategoryDTOHive.addCategoryDTO(name: "Salary");
    }
  }
}

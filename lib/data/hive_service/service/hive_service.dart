import 'package:flutter/material.dart';
import 'package:happy_money/data/hive_service/service/category_dto_hive.dart';
import 'package:happy_money/data/hive_service/service/wallet_dto_hive.dart';
import 'package:happy_money/data/models/category_dto.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';
import 'package:happy_money/data/models/wallet_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../data_source/wallet_data_source.dart';

class HiveService {
  Future<void> registerAdapterHive() async {
    Hive.registerAdapter(WalletDTOAdapter());
    Hive.registerAdapter(CategoryDTOAdapter());
    Hive.registerAdapter(TransactionDTOAdapter());
  }

  Future<void> openBoxHive() async {
    await Hive.openBox<WalletDTO>('WalletDTOBox');
    await Hive.openBox<CategoryDTO>('CategoryDTOBox');
    await Hive.openBox<TransactionDTO>('TransactionDTOBox');
  }

  String generateUniquekey(Box box) {
    String uniqueKey = "";
    uniqueKey = Uuid().v4();
    while (
        box.values.toList().any((element) => element.uniqueKey == uniqueKey)) {
      uniqueKey = Uuid().v4();
    }
    return uniqueKey;
  }

  void seedHive() {
    if (WalletDataSource.getListWalletDTO().isEmpty) {
      WalletDTOHive.addWalletDTO(
        name: 'Cash',
        isMainWallet: true,
      );

      // WalletDTOHive.addWalletDTO(
      //   name: 'Mizuho',
      //   isMainWallet: false,
      // );

      //Spending
      CategoryDTOHive.addCategoryDTO(
        iconPath: "meat",
        name: "Food",
        color: const Color.fromARGB(255, 59, 255, 131),
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "bucket",
        name: "Water Bill",
        color: Colors.blue,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "iphone",
        name: "Phone Bill",
        color: Colors.red,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "lightning",
        name: "Electricity Bill",
        color: Colors.brown,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "file",
        name: "Gas Bill",
        color: Colors.orange,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "truck",
        name: "Transportation",
        color: Colors.green,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "book",
        name: "Education",
        color: Colors.pink,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "shop",
        name: "Home Service",
        color: const Color.fromARGB(255, 85, 39, 176),
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "medicine",
        name: "Medical",
        color: Colors.white,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "gym",
        name: "Sport",
        color: Colors.greenAccent,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "face-neutral",
        name: "Other Expense",
        color: Colors.grey,
        isSpending: true,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "euro circle",
        name: "Loan",
        color: Colors.red,
        isSpending: true,
      );

      //Income
      CategoryDTOHive.addCategoryDTO(
        iconPath: "cash",
        name: "Salary",
        color: Colors.green,
        isSpending: false,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "face-neutral",
        name: "Other Income",
        color: const Color.fromARGB(255, 186, 220, 187),
        isSpending: false,
      );
      CategoryDTOHive.addCategoryDTO(
        iconPath: "exclamation mark triangle",
        name: "Debt",
        color: Color.fromARGB(255, 5, 93, 8),
        isSpending: false,
      );
    }
  }
}

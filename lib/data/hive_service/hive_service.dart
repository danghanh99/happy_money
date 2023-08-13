import 'dart:io';
import 'package:happy_money/data/hive_service/wallet_dto_hive.dart';
import 'package:happy_money/data/models/wallet_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data_source/wallet_data_source.dart';

class HiveService {
  Future<void> registerAdapterHive() async {
    Hive.registerAdapter(WalletDTOAdapter());
  }

  Future<void> openBoxHive() async {
    await Hive.openBox<WalletDTO>('WalletDTOBox');
  }

  void seedHive() {
    if (WalletDataSource.getListWalletDTO().isEmpty) {
      WalletDTOHive.addWalletDTO(
        name: 'Wallet',
        isMainWallet: true,
      );

      WalletDTOHive.addWalletDTO(
        name: 'Mizuho',
        isMainWallet: false,
      );
    }
  }
}

import 'package:happy_money/data/models/wallet_dto.dart';

import '../boxes.dart';
import 'hive_service.dart';

class WalletDTOHive {
  static Future<int> addWalletDTO({
    required String name,
    String? iconPath,
    required bool isMainWallet,
  }) async {
    final box = Boxes.getBoxWalletDTO();

    final walletDTO = WalletDTO(
      name: name,
      iconPath: iconPath,
      isMainWallet: isMainWallet,
      uniqueKey: generateUnikeyWallet(),
    );
    box.add(walletDTO);
    return 1;
  }

  static String generateUnikeyWallet() {
    final box = Boxes.getBoxWalletDTO();
    String uniqueKey = HiveService().generateUniquekey(box);
    return uniqueKey;
  }
}

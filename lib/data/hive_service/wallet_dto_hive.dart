import 'package:happy_money/data/models/wallet_dto.dart';

import 'boxes.dart';

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
    );
    box.add(walletDTO);
    return 1;
  }
}

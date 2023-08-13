import '../../models/wallet_dto.dart';
import '../boxes.dart';

class WalletDataSource {
  static List<WalletDTO> getListWalletDTO() {
    List<WalletDTO> listWalletDTO = [];
    try {
      final box = Boxes.getBoxWalletDTO();
      listWalletDTO = box.values.toList();
      return listWalletDTO;
    } on Exception catch (err) {
      return listWalletDTO;
    }
  }
}

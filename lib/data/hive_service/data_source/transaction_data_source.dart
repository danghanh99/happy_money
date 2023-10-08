import '../../models/transactionn_dto.dart';
import '../boxes.dart';

class TransactionDataSource {
  static List<TransactionDTO> getListTransactionDTO() {
    List<TransactionDTO> listTransactionDTO = [];
    try {
      final box = Boxes.getBoxTransactionDTO();
      listTransactionDTO = box.values.toList();
      return listTransactionDTO;
    } on Exception catch (err) {
      return listTransactionDTO;
    }
  }

  static bool deleteTransactionDTO(String uniqueKey) {
    try {
      final box = Boxes.getBoxTransactionDTO();
      int index = box.values
          .toList()
          .indexWhere((element) => element.uniqueKey == uniqueKey);
      box.deleteAt(index);
      return true;
    } on Exception catch (err) {
      return false;
    }
  }
}

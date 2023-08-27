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
}

import 'package:happy_money/data/models/transactionn_dto.dart';

class Cycle {
  Cycle({
    required this.year,
    required this.month,
    required this.from,
    required this.to,
    required this.listTransactionDTO,
  });

  late int year;
  late int month;
  late DateTime from;
  late DateTime to;
  late List<TransactionDTO> listTransactionDTO;
}

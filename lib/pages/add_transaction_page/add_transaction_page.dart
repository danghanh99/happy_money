import 'package:happy_money/data/models/transactionn_dto.dart';
import 'package:happy_money/data/models/wallet_dto.dart';
import 'package:happy_money/pages/add_transaction_page/list_category/list_category_page.dart';
import 'package:flutter/material.dart';
import 'package:happy_money/pages/add_transaction_page/wallet/list_wallet_page.dart';
import '../../data/hive_service/service/transaction_dto_hive.dart';
import 'add_page2/add_transaction_page2.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({
    super.key,
    required this.listWalletDTO,
    this.editTransaction,
  });

  final List<WalletDTO> listWalletDTO;
  final TransactionDTO? editTransaction;

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int currentview = 0;
  late List<Widget> pages;

  TransactionDTO transactionDTO = new TransactionDTO(
    uniqueKey: TransactionDTOHive.generateUnikeyTransaction(),
  );

  @override
  void initState() {
    transactionDTO.wallet = widget.listWalletDTO[0];
    if (widget.editTransaction != null) {
      transactionDTO = widget.editTransaction!;
    }
    pages = [
      AddTransactionPage2(
        transactionDTO: transactionDTO,
        goToCategory: () {
          setState(() {
            currentview = 1;
          });
        },
        goToWallet: () {
          setState(() {
            currentview = 2;
          });
        },
      ),
      ListCategoryPage(
        setCategory: (category) {
          setState(() {
            transactionDTO.category = category;
          });
        },
        goToAddPage: () {
          setState(() {
            currentview = 0;
          });
        },
      ),
      ListWalletPage(
          listWallet: widget.listWalletDTO,
          goToAddPage: () {
            setState(() {
              currentview = 0;
            });
          },
          setWallet: (value) {
            setState(() {
              transactionDTO.wallet = value;
            });
          }),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return pages[currentview];
  }
}

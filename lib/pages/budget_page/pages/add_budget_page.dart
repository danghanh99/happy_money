import 'package:happy_money/data/models/wallet_dto.dart';
import 'package:happy_money/pages/add_transaction_page/list_category/list_category_page.dart';
import 'package:flutter/material.dart';
import 'package:happy_money/pages/add_transaction_page/wallet/list_wallet_page.dart';
import '../../../data/hive_service/data_source/wallet_data_source.dart';
import '../../../data/hive_service/service/budget_dto_hive.dart';
import '../../../data/models/budget_dto.dart';
import 'add_budget_page2.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({
    super.key,
    // required this.listWalletDTO,
    this.editBudget,
    required this.isEdit,
  });

  // final List<WalletDTO> listWalletDTO;
  final BudgetDTO? editBudget;
  final bool isEdit;

  @override
  _AddBudgetPageState createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  int currentview = 0;
  late List<Widget> pages;

  BudgetDTO budgetDTO = new BudgetDTO(
    uniqueKey: BudgetDTOHive.generateUnikeyBudget(),
  );
  late List<WalletDTO> listWallet;

  @override
  void initState() {
    listWallet = WalletDataSource.getListWalletDTO();
    budgetDTO.wallet = listWallet[0];
    if (widget.editBudget != null) {
      budgetDTO = widget.editBudget!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      AddBudgetPage2(
        isEdit: widget.isEdit,
        budgetDTO: budgetDTO,
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
            budgetDTO.category = category;
          });
        },
        goToAddPage: () {
          setState(() {
            currentview = 0;
          });
        },
      ),
      ListWalletPage(
          listWallet: listWallet,
          goToAddPage: () {
            setState(() {
              currentview = 0;
            });
          },
          setWallet: (value) {
            setState(() {
              budgetDTO.wallet = value;
            });
          }),
    ];
    return pages[currentview];
  }
}

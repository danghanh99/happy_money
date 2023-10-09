import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/hive_service/data_source/category_data_source.dart';
import 'package:happy_money/data/models/category_dto.dart';
import 'package:happy_money/pages/overview_page/components/total_balance.dart';
import 'package:happy_money/pages/overview_page/components/wallet_info.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/hive_service/data_source/wallet_data_source.dart';
import '../../data/models/transactionn_dto.dart';
import '../../data/models/wallet_dto.dart';
import 'components/expense_report_page.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<WalletDTO>('WalletDTOBox').listenable(),
        builder: (context, walletDTOBox, widget) {
          List<WalletDTO> listWallet = walletDTOBox.values.toList();
          return ValueListenableBuilder(
              valueListenable:
                  Hive.box<CategoryDTO>('CategoryDTOBox').listenable(),
              builder: (context, categoryDTOBox, widget) {
                List<CategoryDTO> listCategory = categoryDTOBox.values.toList();
                return ValueListenableBuilder(
                    valueListenable:
                        Hive.box<TransactionDTO>('TransactionDTOBox')
                            .listenable(),
                    builder: (context, transactionDTOBox, widget) {
                      List<TransactionDTO> listTransaction =
                          transactionDTOBox.values.toList();

                      int total = countTotal(listTransaction);
                      return Scaffold(
                        backgroundColor:
                            const Color.fromARGB(255, 245, 242, 242),
                        body: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                TotalBalance(total: total),
                                SizedBox(
                                  height: 15.h,
                                ),
                                WalletInfo(total: total),
                                SizedBox(
                                  height: 50.h,
                                ),
                                ExpenseReportPage(
                                  listTransaction: listTransaction,
                                  listCategoryDTO: listCategory,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              });
        });
  }
}

int countTotal(List<TransactionDTO> list) {
  int total = 0;
  list.forEach((element) {
    total = total +
        (element.category!.isSpending ? element.amount! * -1 : element.amount!);
  });
  return total;
}

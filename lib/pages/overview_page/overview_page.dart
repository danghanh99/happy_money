import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/hive_service/data_source/category_data_source.dart';
import 'package:happy_money/data/models/category_dto.dart';
import 'package:happy_money/pages/overview_page/components/total_balance.dart';
import 'package:happy_money/pages/overview_page/components/wallet_info.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../data/hive_service/data_source/wallet_data_source.dart';
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
  List<WalletDTO> listWallet = [];
  List<CategoryDTO> listCategory = [];

  @override
  void initState() {
    listWallet = WalletDataSource.getListWalletDTO();
    listCategory = CategoryDataSource.getListCategoryDTO();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listCategory;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 242, 242),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const TotalBalance(),
              SizedBox(
                height: 15.h,
              ),
              const WalletInfo(),
              SizedBox(
                height: 50.h,
              ),
              const ExpenseReportPage()
            ],
          ),
        ),
      ),
    );
  }
}

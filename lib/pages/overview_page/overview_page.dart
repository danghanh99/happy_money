import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/pages/overview_page/components/total_balance.dart';
import 'package:happy_money/pages/overview_page/components/wallet_info.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'components/expense_report_page.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
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

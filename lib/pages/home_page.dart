import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/components/custom_bottom_bar_with_sheet.dart';
import 'package:happy_money/pages/report_page/report_page.dart';
import 'package:happy_money/pages/overview_page/overview_page.dart';
import 'package:happy_money/pages/budget_page/budget_page.dart';
import 'package:happy_money/pages/setting_page/setting_page.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../data/hive_service/data_source/wallet_data_source.dart';
import '../data/models/wallet_dto.dart';
import 'add_transaction_page/add_transaction_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;
  final _bottomBarController = BottomBarWithSheetController(initialIndex: 0);
  List<WalletDTO> listWallet = [];
  @override
  void initState() {
    listWallet = WalletDataSource.getListWalletDTO();
    _selectedWidget = const OverviewPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (context, child) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 245, 242, 242),
              body: SafeArea(
                left: true,
                top: true,
                right: true,
                bottom: true,
                child: _selectedWidget,
              ),
              bottomNavigationBar: CustomBottomBarWithSheet(
                mainActionButtonTheme:
                    const MainActionButtonTheme(color: Colors.green),
                controller: _bottomBarController,
                bottomBarTheme: const BottomBarTheme(
                  mainButtonPosition: MainButtonPosition.middle,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  itemIconColor: Colors.grey,
                  selectedItemIconColor: Colors.green,
                  itemTextStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                  selectedItemTextStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 12.0,
                  ),
                ),
                onSelectItem: (index) {
                  print(index);
                  onPressed(index);
                },
                onClickAdd: () {
                  showMaterialModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0.sp),
                              topRight: Radius.circular(16.0.sp))),
                      context: context,
                      builder: (context) => AddTransactionPage(
                            listWalletDTO: listWallet,
                            isEdit: false,
                          ));
                },
                items: const [
                  BottomBarWithSheetItem(
                    icon: Icons.home,
                    label: 'Overview',
                  ),
                  BottomBarWithSheetItem(
                    icon: Icons.pie_chart_rounded,
                    label: 'Report',
                  ),
                  BottomBarWithSheetItem(
                    icon: Icons.wallet,
                    label: 'Budget',
                  ),
                  BottomBarWithSheetItem(
                    icon: Icons.settings,
                    label: 'Setting',
                  ),
                ],
              ),
            );
          }),
    );
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const OverviewPage();
      } else if (index == 1) {
        _selectedWidget = const ReportPage();
      } else if (index == 2) {
        _selectedWidget = const BudgetPage();
      } else if (index == 3) {
        _selectedWidget = const SettingPage();
      }
    });
  }
}

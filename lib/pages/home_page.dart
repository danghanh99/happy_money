import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/components/custom_bottom_bar_with_sheet.dart';
import 'package:happy_money/pages/calendar_page/calendar_page.dart';
import 'package:happy_money/pages/overview_page/overview_page.dart';
import 'package:happy_money/pages/budget_page/budget_page.dart';
import 'package:happy_money/pages/setting_page/setting_page.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

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

  @override
  void initState() {
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
                  print('index');
                },
                items: const [
                  BottomBarWithSheetItem(
                    icon: Icons.home,
                    label: 'Overview',
                  ),
                  BottomBarWithSheetItem(
                    icon: Icons.calendar_month,
                    label: 'Calendar',
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
        _selectedWidget = const CalendarPage();
      } else if (index == 2) {
        _selectedWidget = const BudgetPage();
      } else if (index == 3) {
        _selectedWidget = const SettingPage();
      }
    });
  }
}

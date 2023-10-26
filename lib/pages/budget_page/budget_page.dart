import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../report_page/components/toggle_line.dart';
import 'components/add_budget_button.dart';
import 'components/budget_header.dart';
import 'components/budget_item.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  CarouselController carouselController = new CarouselController();
  late bool showIncome;

  DateTime currentTime = DateTime.now();
  @override
  void initState() {
    showIncome = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [runningPage(), finishedPage()];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(),
        color: const Color.fromARGB(255, 245, 242, 242),
      ),
      height: 800.h,
      child: Column(
        children: [
          BudgetHeader(),
          SizedBox(
            height: 10.h,
          ),
          ToggleLine(
            firstString: "Running",
            secondString: "Finished",
            showIncome: showIncome,
            changeToggle: () {
              setState(() {
                showIncome = !showIncome;
                carouselController.jumpToPage(showIncome ? 1 : 0);
              });
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CarouselSlider.builder(
            itemCount: 2,
            options: CarouselOptions(
              viewportFraction: 1,
              height: 659.h,
              onPageChanged: (index, reason) {
                setState(() {
                  showIncome = index == 1;
                });
              },
            ),
            carouselController: carouselController,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    list[itemIndex],
          )
        ],
      ),
    );
  }

  Widget runningPage() {
    return Column(
      children: [
        AddBudgetButton(),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 585.h,
          child: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    BudgetItem(
                        fromDate: currentTime,
                        toDate: currentTime,
                        iconPath: "cash",
                        categoryName: "Electric",
                        amount: 2000000,
                        usedAmount: 1510003),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget finishedPage() {
    return Container();
  }
}

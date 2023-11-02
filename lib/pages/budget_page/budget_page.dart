import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/models/budget_dto.dart';
import 'package:happy_money/pages/budget_page/pages/add_budget_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/hive_service/data_source/category_data_source.dart';
import '../../data/models/transactionn_dto.dart';
import '../report_page/components/toggle_line.dart';
import 'components/add_budget_button.dart';
import 'components/budget_header.dart';
import 'components/budget_item.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
    return ValueListenableBuilder(
        valueListenable: Hive.box<BudgetDTO>('BudgetDTOBox').listenable(),
        builder: (context, budgetDTOBox, widget) {
          return ValueListenableBuilder(
              valueListenable:
                  Hive.box<TransactionDTO>('TransactionDTOBox').listenable(),
              builder: (context, transactionDTOBox, widget) {
                List<TransactionDTO> listTransaction =
                    transactionDTOBox.values.toList();
                List<BudgetDTO> listBudget = budgetDTOBox.values.toList();
                List<Widget> list = [runningPage(listBudget), finishedPage()];

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
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            list[itemIndex],
                      )
                    ],
                  ),
                );
              });
        });
  }

  Widget runningPage(List<BudgetDTO> listBudget) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showMaterialModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0.sp),
                        topRight: Radius.circular(16.0.sp))),
                context: context,
                builder: (context) => AddBudgetPage(
                      isEdit: false,
                    ));
          },
          child: AddBudgetButton(),
        ),
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
              itemCount: listBudget.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showMaterialModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.0.sp),
                                    topRight: Radius.circular(16.0.sp))),
                            context: context,
                            builder: (context) => AddBudgetPage(
                                  isEdit: true,
                                  editBudget: listBudget[index],
                                ));
                      },
                      child: BudgetItem(
                        colorValue: listBudget[index].category!.colorValue!,
                        fromDate: listBudget[index].fromDate!,
                        toDate: listBudget[index].toDate!,
                        iconPath: listBudget[index].category!.iconPath,
                        categoryName: listBudget[index].category!.name,
                        amount: listBudget[index].amount!,
                        usedAmount: CategoryDataSource.getUsedOfCategory(
                          listBudget[index].category!.uniqueKey,
                          listBudget[index].fromDate!,
                          listBudget[index].toDate!,
                        ),
                      ),
                    ),
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

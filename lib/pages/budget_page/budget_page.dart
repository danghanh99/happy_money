import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/models/budget_dto.dart';
import 'package:happy_money/pages/budget_page/pages/add_budget_page.dart';
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
  final ScrollController scrollController1 = ScrollController();
  final ScrollController scrollController2 = ScrollController();

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
                List<BudgetDTO> listBudget = budgetDTOBox.values.toList();
                List<Widget> list = [
                  runningPage(listBudget),
                  finishedPage(listBudget)
                ];

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
    List<BudgetDTO> listBudgetUnFinished = getUnFinishedlistBudget(listBudget);
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
            controller: scrollController1,
            thumbVisibility: true,
            child: ListView.builder(
              controller: scrollController1,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listBudgetUnFinished.length,
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
                                  editBudget: listBudgetUnFinished[index],
                                ));
                      },
                      child: BudgetItem(
                        colorValue:
                            listBudgetUnFinished[index].category!.colorValue!,
                        fromDate: listBudgetUnFinished[index].fromDate!,
                        toDate: listBudgetUnFinished[index].toDate!,
                        iconPath:
                            listBudgetUnFinished[index].category!.iconPath,
                        categoryName:
                            listBudgetUnFinished[index].category!.name,
                        amount: listBudgetUnFinished[index].amount!,
                        usedAmount: CategoryDataSource.getUsedOfCategory(
                          listBudgetUnFinished[index].category!.uniqueKey,
                          listBudgetUnFinished[index].fromDate!,
                          listBudgetUnFinished[index].toDate!,
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

  Widget finishedPage(List<BudgetDTO> listBudget) {
    List<BudgetDTO> listBudgetFinished = getFinishedlistBudget(listBudget);
    return Container(
      height: 585.h,
      child: Scrollbar(
        controller: scrollController2,
        thumbVisibility: true,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          controller: scrollController2,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listBudgetFinished.length,
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
                              editBudget: listBudgetFinished[index],
                            ));
                  },
                  child: BudgetItem(
                    colorValue: listBudgetFinished[index].category!.colorValue!,
                    fromDate: listBudgetFinished[index].fromDate!,
                    toDate: listBudgetFinished[index].toDate!,
                    iconPath: listBudgetFinished[index].category!.iconPath,
                    categoryName: listBudgetFinished[index].category!.name,
                    amount: listBudgetFinished[index].amount!,
                    usedAmount: CategoryDataSource.getUsedOfCategory(
                      listBudgetFinished[index].category!.uniqueKey,
                      listBudgetFinished[index].fromDate!,
                      listBudgetFinished[index].toDate!,
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
    );
  }

  List<BudgetDTO> getFinishedlistBudget(List<BudgetDTO> list) {
    final today = DateTime.now();
    return list.where((element) => today.isAfter(element.toDate!)).toList();
  }

  List<BudgetDTO> getUnFinishedlistBudget(List<BudgetDTO> list) {
    final today = DateTime.now();
    return list
        .where((element) =>
            today.isBefore(element.toDate!) ||
            today.isAtSameMomentAs(element.toDate!))
        .toList();
  }
}

import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/components/format_money.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../components/spend_model.dart';
import '../../../data/models/category_dto.dart';

class ExpenseReportPage extends StatefulWidget {
  const ExpenseReportPage({
    super.key,
    required this.listTransaction,
    required this.listCategoryDTO,
  });

  final List<TransactionDTO> listTransaction;
  final List<CategoryDTO> listCategoryDTO;

  @override
  State<ExpenseReportPage> createState() => _ExpenseReportPageState();
}

class _ExpenseReportPageState extends State<ExpenseReportPage> {
  late bool filterByWeek;
  @override
  void initState() {
    filterByWeek = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int countThisWeek = countSpentWeek(widget.listTransaction, now);
    int countLastWeek = countSpentWeek(
        widget.listTransaction, now.subtract(const Duration(days: 7)));

    int countThisMonth = countSpentMonth(widget.listTransaction, now);
    int countLastMonth = countSpentMonth(
        widget.listTransaction, DateTime(now.year, now.month - 1));

    List<String> hashWeek = countSpendTheMostHash(
        listWeek(widget.listTransaction, now), widget.listCategoryDTO, now);

    List<String> hashMonth = countSpendTheMostHash(
        listMonth(widget.listTransaction, now), widget.listCategoryDTO, now);

    return Column(
      children: [
        Row(
          children: [
            Text('Expense report',
                style: TextStyle(
                  color: const Color.fromARGB(255, 103, 101, 101),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                )),
            const Spacer(),
            Text('View report',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width.w,
              height: 500.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(7.0.sp)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    ToggleSwitch(
                      borderWidth: 2.sp,
                      borderColor: const [
                        Color.fromARGB(255, 245, 242, 242),
                      ],
                      minWidth: 180.w,
                      minHeight: 35.h,
                      fontSize: 16.0,
                      initialLabelIndex: filterByWeek ? 0 : 1,
                      activeBgColor: [Colors.white],
                      activeFgColor: Colors.black,
                      inactiveBgColor: const Color.fromARGB(255, 245, 242, 242),
                      inactiveFgColor: Colors.grey[900],
                      totalSwitches: 2,
                      labels: ['Week', 'Month'],
                      onToggle: (index) {
                        setState(() {
                          filterByWeek = index == 0;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              FormatMoney.formatTo(
                                  filterByWeek ? countThisWeek : countThisMonth,
                                  "VND"),
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Text(
                                  'Total spent this ' +
                                      (filterByWeek ? "week" : "month"),
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 103, 101, 101),
                                    fontSize: 17.sp,
                                  )),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      filterByWeek
                                          ? countTrend(
                                              countLastWeek, countThisWeek)
                                          : countTrend(
                                              countLastMonth, countThisMonth),
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                  // Icon(
                                  //   Icons.percent,
                                  //   size: 18.sp,
                                  // ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    FormatMoney.formatTo(
                                        filterByWeek
                                            ? countLastWeek
                                            : countLastMonth,
                                        null),
                                  ),
                                  Container(
                                    width: 80.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0.sp)),
                                    ),
                                  ),
                                  const Text("Last Month"),
                                ],
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    FormatMoney.formatTo(
                                        filterByWeek
                                            ? countThisWeek
                                            : countThisMonth,
                                        null),
                                  ),
                                  Container(
                                    width: 80.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 3.0,
                                        ),
                                      ),
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0.sp)),
                                    ),
                                  ),
                                  const Text("This Month"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Spend the most',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.rounded_corner_outlined,
                                        size: 50.sp,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              filterByWeek
                                                  ? hashWeek[0]
                                                  : hashMonth[0],
                                              style: TextStyle(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text(
                                            FormatMoney.formatTo(
                                                int.parse(filterByWeek
                                                    ? hashWeek[1]
                                                    : hashMonth[1]),
                                                "VND"),
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    (filterByWeek
                                            ? hashWeek[2]
                                            : hashMonth[2]) +
                                        '%',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

int countSpentWeek(List<TransactionDTO> listTransactionDTO, DateTime date) {
  DateTime from = findFirstDateOfTheWeek(date);
  DateTime to = findLastDateOfTheWeek(date);

  List<TransactionDTO> list = listTransactionDTO
      .where((element) =>
          element.createdAt!.isAfter(from) && element.createdAt!.isBefore(to) ||
          element.createdAt!.isAtSameMomentAs(from) ||
          element.createdAt!.isAtSameMomentAs(to))
      .toList();

  int total = 0;
  list.forEach((element) {
    if (element.category!.isSpending) {
      total = total + element.amount!;
    }
  });
  return total;
}

int countSpentMonth(List<TransactionDTO> listTransactionDTO, DateTime date) {
  DateTime from = findFirstDateOfTheMonth(date);
  DateTime to = findLastDateOfTheMonth(date);

  List<TransactionDTO> list = listTransactionDTO
      .where((element) =>
          element.createdAt!.isAfter(from) && element.createdAt!.isBefore(to) ||
          element.createdAt!.isAtSameMomentAs(from) ||
          element.createdAt!.isAtSameMomentAs(to))
      .toList();

  int total = 0;
  list.forEach((element) {
    if (element.category!.isSpending) {
      total = total + element.amount!;
    }
  });
  return total;
}

List<TransactionDTO> listWeek(
  List<TransactionDTO> listTransaction,
  DateTime date,
) {
  DateTime fromWeek = findFirstDateOfTheWeek(date);
  DateTime toWeek = findLastDateOfTheWeek(date);
  List<TransactionDTO> listWeek = listTransaction
      .where((element) =>
          element.createdAt!.isAfter(fromWeek) &&
              element.createdAt!.isBefore(toWeek) ||
          element.createdAt!.isAtSameMomentAs(fromWeek) ||
          element.createdAt!.isAtSameMomentAs(toWeek))
      .toList();
  return listWeek;
}

List<TransactionDTO> listMonth(
  List<TransactionDTO> listTransaction,
  DateTime date,
) {
  DateTime fromMonth = findFirstDateOfTheMonth(date);
  DateTime toMonth = findLastDateOfTheMonth(date);
  List<TransactionDTO> listMonth = listTransaction
      .where((element) =>
          element.createdAt!.isAfter(fromMonth) &&
              element.createdAt!.isBefore(toMonth) ||
          element.createdAt!.isAtSameMomentAs(fromMonth) ||
          element.createdAt!.isAtSameMomentAs(toMonth))
      .toList();
  return listMonth;
}

List<String> countSpendTheMostHash(
  List<TransactionDTO> listTransaction,
  List<CategoryDTO> listCategoryDTO,
  DateTime date,
) {
  List<SpendModel> listSpendModel = [];
  listCategoryDTO.forEach((category) {
    List<TransactionDTO> list = listTransaction
        .where((element) =>
            element.category!.uniqueKey == category.uniqueKey &&
            element.category!.isSpending)
        .toList();
    int total = list.map((e) => e.amount).fold(0, (a, b) => a + (b ?? 0));
    SpendModel spent = new SpendModel(name: category.name, spent: total);
    listSpendModel.add(spent);
  });

// tu nho den lon
  listSpendModel.sort((a, b) => a.spent.compareTo(b.spent));
  int categoryAmount = listSpendModel[listSpendModel.length - 1].spent;
  String categoryName = listSpendModel[listSpendModel.length - 1].name;
  int total = listSpendModel.map((e) => e.spent).fold(0, (a, b) => a + b);

  int percent = total <= 0 ? 0 : 100 * categoryAmount ~/ total;

  return [categoryName, categoryAmount.toString(), percent.toString()];
}

DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday - 1));
}

DateTime findLastDateOfTheWeek(DateTime dateTime) {
  return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
}

DateTime findLastDateOfTheMonth(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month + 1, 0);
}

DateTime findFirstDateOfTheMonth(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, 1);
}

String countTrend(int last, int current) {
  int trendPercent = 100 * (current - last) ~/ last;
  return (trendPercent > 0 ? "+" : "-") + trendPercent.toString() + "%";
}

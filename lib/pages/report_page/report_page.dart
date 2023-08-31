import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:happy_money/components/pie_chart/custom_chart_values_options.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../components/pie_chart/custom_legend_options.dart';
import '../../components/pie_chart/custom_pie_chart.dart';
import '../../view_models/transaction_model.dart';
import 'components/toggle_line.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({
    super.key,
  });

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool showChartStatus = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<TransactionDTO>('TransactionDTOBox').listenable(),
        builder: (context, transactionBox, widget) {
          List<TransactionDTO> listTransaction = transactionBox.values.toList();
          List<TransactionModel> listTransactionModel =
              setTransactionModel(listTransaction);
          int total = countTotal(listTransaction);
          int inComeMoney = getIncome(listTransaction);
          int spendingMoney = getSpending(listTransaction);
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 245, 242, 242),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 223, 218, 218),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.wallet,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "Wallet",
                              style: TextStyle(
                                fontSize: 17.0.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Transform.rotate(
                                angle: -90 * pi / 180,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 13.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "4.000.000 d",
                        style: TextStyle(
                          fontSize: 17.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.w,
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ToggleSwitch(
                        borderWidth: 2.sp,
                        borderColor: const [
                          Color.fromARGB(255, 242, 234, 234),
                        ],
                        minWidth: 130.w,
                        minHeight: 35.h,
                        fontSize: 16.0,
                        initialLabelIndex: 1,
                        activeBgColor: [
                          Colors.green,
                          Color.fromARGB(255, 88, 219, 32),
                        ],
                        activeFgColor: Colors.black,
                        inactiveBgColor: Colors.white,
                        inactiveFgColor: Colors.grey[900],
                        totalSwitches: 2,
                        labels: ['Month', 'Year'],
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                      Container(
                        width: 40.w,
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      Container(
                        alignment: Alignment.center,
                        width: 300.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 64, 234, 70),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "07/2023",
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Text(
                              "(01/07-31/07)",
                              style: TextStyle(
                                fontSize: 15.0.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: 180 * pi / 180,
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  //start scroll
                  Expanded(
                    child: Scrollbar(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Income",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        "+" + inComeMoney.toString(),
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Spending",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        "-" + spendingMoney.toString(),
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 190.w,
                                        child: Divider(
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Surplus",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        (inComeMoney - spendingMoney)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const ToggleLine(),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  FlutterSwitch(
                                    activeColor: Colors.green,
                                    width: 65.w,
                                    height: 30.h,
                                    valueFontSize: 15.0,
                                    toggleSize: 20.sp,
                                    value: showChartStatus,
                                    showOnOff: true,
                                    onToggle: (val) {
                                      setState(() {
                                        showChartStatus = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              listTransaction.isEmpty || !showChartStatus
                                  ? Container()
                                  : PieChart(
                                      dataMap: setDataMap(listTransaction),
                                      animationDuration:
                                          Duration(milliseconds: 300),
                                      chartRadius: 250.w,
                                      colorList: setColorList(listTransaction),
                                      initialAngleInDegree: 0,
                                      chartType: ChartType.disc,
                                      ringStrokeWidth: 100.w,
                                      chartValuesOptions:
                                          const ChartValuesOptions(
                                        showChartValues: true,
                                      ),
                                      legendOptions: const LegendOptions(
                                        showLegends: false,
                                      ),
                                    ),
                              SizedBox(
                                height: 10.h,
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: listTransactionModel.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Color(listTransactionModel[index]
                                          .category!
                                          .colorValue!),
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5.sp,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5.sp,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.home,
                                              size: 50.sp,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  listTransactionModel[index]
                                                      .category!
                                                      .name
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 25.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  listTransactionModel[index]
                                                          .note ??
                                                      "",
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          listTransactionModel[index]
                                              .amount
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  int countTotal(List<TransactionDTO> list) {
    int total = 0;
    list.forEach((element) {
      total = total + element.amount!;
    });
    return total;
  }

  Map<String, double> setDataMap(List<TransactionDTO> list) {
    Map<String, double> dataMap = {};
    list.forEach((element) {
      if (!dataMap.containsKey(element.category!.name)) {
        dataMap.addAll({element.category!.name: element.amount!.toDouble()});
      } else {
        dataMap.update(
          element.category!.name,
          (value) => value + element.amount!.toDouble(),
        );
      }
    });
    return dataMap;
  }

  List<TransactionModel> setTransactionModel(List<TransactionDTO> list) {
    List<TransactionModel> newList = [];
    list.forEach((element) {
      var exist = newList
          .where((item) => item.category!.name == element.category!.name)
          .toList();
      if (exist.isEmpty) {
        newList.add(TransactionModel().convertToTransactionModel(element));
      } else {
        int index = newList.indexWhere(
            (model) => model.category!.name == element.category!.name);
        newList[index].amount = newList[index].amount! + element.amount!;
      }
    });
    return newList;
  }

  List<Color> setColorList(List<TransactionDTO> list) {
    List<Color> listColor = [];
    list.forEach((element) {
      if (!listColor.contains(Color(element.category!.colorValue!))) {
        listColor.add(Color(element.category!.colorValue!));
      }
    });
    return listColor;
  }

  int getIncome(List<TransactionDTO> list) {
    int income = 0;
    list
        .where((transaction) => transaction.category!.isSpending == false)
        .toList()
        .forEach((element) {
      income = income + element.amount!;
    });

    return income;
  }

  int getSpending(List<TransactionDTO> list) {
    int spending = 0;
    list
        .where((transaction) => transaction.category!.isSpending == true)
        .toList()
        .forEach((element) {
      spending = spending + element.amount!;
    });

    return spending;
  }
}

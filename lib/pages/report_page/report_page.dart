import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:happy_money/components/pie_chart/custom_chart_values_options.dart';
import 'package:happy_money/data/hive_service/service/transaction_dto_hive.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';
import 'package:happy_money/pages/report_page/components/month_year_header.dart';
import 'package:happy_money/pages/report_page/components/report_header.dart';
import 'package:happy_money/pages/report_page/components/slider_month.dart';
import 'package:happy_money/view_models/cycle.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../components/pie_chart/custom_legend_options.dart';
import '../../components/pie_chart/custom_pie_chart.dart';
import '../../data/hive_service/data_source/wallet_data_source.dart';
import '../../data/models/wallet_dto.dart';
import '../../view_models/transaction_model.dart';
import '../add_transaction_page/add_transaction_page.dart';
import 'components/toggle_line.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({
    super.key,
  });

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool showChartStatus = true;
  List<int> listMonth = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List<int> listYear = [for (var i = 2022; i <= 2023; i += 1) i];
  List<Cycle> listCycle = [];
  int currentCycleIndex = 0;
  DateTime currentDate = DateTime.now();
  bool showIncome = true;
  List<WalletDTO> listWallet = [];

  @override
  void initState() {
    listWallet = WalletDataSource.getListWalletDTO();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<TransactionDTO>('TransactionDTOBox').listenable(),
        builder: (context, transactionBox, widget) {
          List<TransactionDTO> listTransaction = transactionBox.values.toList();

          int total = countTotal(listTransaction);

          listCycle = setListCycle(listTransaction);
          int currentIndex = getCycleIndex(listCycle, currentDate);
          int inComeMoney =
              getIncome(listCycle[currentIndex].listTransactionDTO);
          int spendingMoney =
              getSpending(listCycle[currentIndex].listTransactionDTO);
          List<TransactionModel> listTransactionModel =
              setTransactionModel(listCycle[currentIndex].listTransactionDTO);
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 245, 242, 242),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  ReportHeader(),
                  SizedBox(
                    height: 10.h,
                  ),
                  MonthYearHeader(
                    currentDate: currentDate,
                    onChangeDate: (value) {
                      setState(() {
                        currentDate = value;
                      });
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      initialPage: currentIndex,
                      viewportFraction: 1,
                      height: 650.h,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        index;
                        print(index);
                        setState(() {
                          currentDate = DateTime(
                              listCycle[index].year, listCycle[index].month, 1);
                        });
                      },
                    ),
                    itemCount: listCycle.length,
                    // carouselController: carouselController,
                    itemBuilder:
                        (BuildContext context, int itemIndex, int idx) {
                      return Container(
                        height: 650.h,
                        child: Column(
                          children: [
                            SliderMonth(
                                currentDate: currentDate,
                                onChangeDate: (value) {
                                  setState(() {
                                    currentDate = value;
                                  });
                                }),
                            SizedBox(
                              height: 15.h,
                            ),
                            //start scroll
                            Expanded(
                              child: Scrollbar(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Spending",
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                                Text(
                                                  "-" +
                                                      spendingMoney.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                        ToggleLine(
                                          changeToggle: () {
                                            setState(() {
                                              showIncome = !showIncome;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        convertList(
                                                    listCycle[currentIndex]
                                                        .listTransactionDTO,
                                                    showIncome)
                                                .isEmpty
                                            ? Container()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                        convertList(
                                                        listCycle[currentIndex]
                                                            .listTransactionDTO,
                                                        showIncome)
                                                    .isEmpty ||
                                                !showChartStatus
                                            ? Container()
                                            : PieChart(
                                                dataMap: setDataMap(
                                                  convertList(
                                                      listCycle[currentIndex]
                                                          .listTransactionDTO,
                                                      showIncome),
                                                ),
                                                animationDuration:
                                                    Duration(milliseconds: 300),
                                                chartRadius: 250.w,
                                                colorList: setColorList(
                                                    convertList(
                                                        listCycle[currentIndex]
                                                            .listTransactionDTO,
                                                        showIncome)),
                                                initialAngleInDegree: 0,
                                                chartType: ChartType.disc,
                                                ringStrokeWidth: 100.w,
                                                chartValuesOptions:
                                                    const ChartValuesOptions(
                                                  showChartValues: true,
                                                ),
                                                legendOptions:
                                                    const LegendOptions(
                                                  showLegends: false,
                                                ),
                                              ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: convertList2(
                                                  listTransactionModel,
                                                  showIncome)
                                              .length,
                                          itemBuilder: (context, index) {
                                            String uniqueKey = convertList2(
                                                        listTransactionModel,
                                                        showIncome)[index]
                                                    .uniqueKey ??
                                                "";
                                            return GestureDetector(
                                              onTap: () {
                                                showMaterialModalBottomSheet(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16.0
                                                                            .sp),
                                                                topRight: Radius
                                                                    .circular(16.0
                                                                        .sp))),
                                                    context: context,
                                                    builder: (context) =>
                                                        AddTransactionPage(
                                                          listWalletDTO:
                                                              listWallet,
                                                          editTransaction:
                                                              TransactionDTOHive
                                                                  .findTransactionDTO(
                                                                      uniqueKey),
                                                        ));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(
                                                    convertList2(
                                                            listTransactionModel,
                                                            showIncome)[index]
                                                        .category!
                                                        .colorValue!,
                                                  ),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
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
                                                              convertList2(
                                                                      listTransactionModel,
                                                                      showIncome)[index]
                                                                  .category!
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 25.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            Text(
                                                              convertList2(listTransactionModel,
                                                                              showIncome)[
                                                                          index]
                                                                      .note ??
                                                                  "",
                                                              style: TextStyle(
                                                                fontSize: 20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      convertList2(
                                                              listTransactionModel,
                                                              showIncome)[index]
                                                          .amount
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
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

  List<Cycle> setListCycle(List<TransactionDTO> listTransactionDTO) {
    List<Cycle> listCycle = [];
    listYear.forEach((year) {
      listMonth.forEach((month) {
        DateTime from = DateTime(year, month, 1);
        DateTime to = new DateTime(from.year, from.month + 1, 0);
        List<TransactionDTO> list = listTransactionDTO
            .where((element) =>
                element.createdAt!.isAfter(from) &&
                    element.createdAt!.isBefore(to) ||
                element.createdAt!.isAtSameMomentAs(from) ||
                element.createdAt!.isAtSameMomentAs(to))
            .toList();
        Cycle cycle = new Cycle(
            year: year,
            month: month,
            from: from,
            to: to,
            listTransactionDTO: list);
        listCycle.add(cycle);
      });
    });
    return listCycle;
  }

  int getCycleIndex(List<Cycle> listCycle, DateTime inputDate) {
    int index = 0;
    Cycle cycle = listCycle.firstWhere((element) =>
        element.year == inputDate.year && element.month == inputDate.month);
    index = listCycle.indexOf(cycle);
    return index;
  }

  List<TransactionDTO> getListIncome(List<TransactionDTO> list) {
    return list.where((element) => !element.category!.isSpending).toList();
  }

  List<TransactionDTO> getListSpending(List<TransactionDTO> list) {
    return list.where((element) => element.category!.isSpending).toList();
  }

  List<TransactionModel> getListIncome2(List<TransactionModel> list) {
    return list.where((element) => !element.category!.isSpending).toList();
  }

  List<TransactionModel> getListSpending2(List<TransactionModel> list) {
    return list.where((element) => element.category!.isSpending).toList();
  }

  List<TransactionDTO> convertList(List<TransactionDTO> list, bool showIncome) {
    return list
        .where((element) => showIncome
            ? !element.category!.isSpending
            : element.category!.isSpending)
        .toList();
  }

  List<TransactionModel> convertList2(
      List<TransactionModel> list, bool showIncome) {
    return list
        .where((element) => showIncome
            ? !element.category!.isSpending
            : element.category!.isSpending)
        .toList();
  }
}

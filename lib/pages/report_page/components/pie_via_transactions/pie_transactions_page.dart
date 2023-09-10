// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_switch/flutter_switch.dart';

// import '../../../../components/pie_chart/custom_chart_values_options.dart';
// import '../../../../components/pie_chart/custom_legend_options.dart';
// import '../../../../components/pie_chart/custom_pie_chart.dart';
// import '../../../../data/models/transactionn_dto.dart';
// import '../../../../view_models/cycle.dart';
// import '../../../../view_models/transaction_model.dart';
// import '../toggle_line.dart';

// class PieTransactionsPage extends StatefulWidget {
//   PieTransactionsPage({
//     super.key,
//     required this.inComeMoney,
//     required this.spendingMoney,
//     required this.showIncome,
//     required this.onchangedShowIncome,
//     required this.listCycle,
//     required this.currentIndex,
//     required this.showChartStatus,
//     required this.onchangedShowChartStatus,
//     required this.listTransactionModel,
//   });

//   int inComeMoney;
//   int spendingMoney;
//   bool showIncome;

//   Function(bool) onchangedShowIncome;

//   List<Cycle> listCycle;
//   int currentIndex;

//   bool showChartStatus;
//   Function(bool) onchangedShowChartStatus;
//   List<TransactionModel> listTransactionModel;
//   @override
//   State<PieTransactionsPage> createState() => _PieTransactionsPageState();
// }

// class _PieTransactionsPageState extends State<PieTransactionsPage> {
//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Scrollbar(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 5.w),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Income",
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         Text(
//                           "+" + widget.inComeMoney.toString(),
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Spending",
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         Text(
//                           "-" + widget.spendingMoney.toString(),
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           width: 190.w,
//                           child: Divider(
//                             thickness: 1,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Surplus",
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         Text(
//                           (widget.inComeMoney - widget.spendingMoney)
//                               .toString(),
//                           style: TextStyle(
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 ToggleLine(
//                   changeToggle: () {
//                     // setState(() {
//                     //   showIncome = !showIncome;
//                     // });
//                     widget.onchangedShowIncome.call(!widget.showIncome);
//                   },
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 convertList(
//                             widget.listCycle[widget.currentIndex]
//                                 .listTransactionDTO,
//                             widget.showIncome)
//                         .isEmpty
//                     ? Container()
//                     : Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(""),
//                           FlutterSwitch(
//                             activeColor: Colors.green,
//                             width: 65.w,
//                             height: 30.h,
//                             valueFontSize: 15.0,
//                             toggleSize: 20.sp,
//                             value: widget.showChartStatus,
//                             showOnOff: true,
//                             onToggle: (val) {
//                               // setState(() {
//                               //   showChartStatus = val;
//                               // });
//                               widget.onchangedShowChartStatus.call(val);
//                             },
//                           ),
//                         ],
//                       ),
//                 convertList(
//                                 widget.listCycle[widget.currentIndex]
//                                     .listTransactionDTO,
//                                 widget.showIncome)
//                             .isEmpty ||
//                         !widget.showChartStatus
//                     ? Container()
//                     : PieChart(
//                         dataMap: setDataMap(
//                           convertList(
//                               widget.listCycle[widget.currentIndex]
//                                   .listTransactionDTO,
//                               widget.showIncome),
//                         ),
//                         animationDuration: Duration(milliseconds: 300),
//                         chartRadius: 250.w,
//                         colorList: setColorList(convertList(
//                             widget.listCycle[widget.currentIndex]
//                                 .listTransactionDTO,
//                             widget.showIncome)),
//                         initialAngleInDegree: 0,
//                         chartType: ChartType.disc,
//                         ringStrokeWidth: 100.w,
//                         chartValuesOptions: const ChartValuesOptions(
//                           showChartValues: true,
//                         ),
//                         legendOptions: const LegendOptions(
//                           showLegends: false,
//                         ),
//                       ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   padding: EdgeInsets.zero,
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount: convertList2(
//                           widget.listTransactionModel, widget.showIncome)
//                       .length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Color(
//                           convertList2(widget.listTransactionModel,
//                                   widget.showIncome)[index]
//                               .category!
//                               .colorValue!,
//                         ),
//                         border: Border(
//                           top: BorderSide(
//                             color: Colors.grey,
//                             width: 0.5.sp,
//                           ),
//                           bottom: BorderSide(
//                             color: Colors.grey,
//                             width: 0.5.sp,
//                           ),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.home,
//                                 size: 50.sp,
//                               ),
//                               SizedBox(
//                                 width: 5.w,
//                               ),
//                               Column(
//                                 children: [
//                                   Text(
//                                     convertList2(widget.listTransactionModel,
//                                             widget.showIncome)[index]
//                                         .category!
//                                         .name
//                                         .toString(),
//                                     style: TextStyle(
//                                       fontSize: 25.sp,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     convertList2(widget.listTransactionModel,
//                                                 widget.showIncome)[index]
//                                             .note ??
//                                         "",
//                                     style: TextStyle(
//                                       fontSize: 20.sp,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Text(
//                             convertList2(widget.listTransactionModel,
//                                     widget.showIncome)[index]
//                                 .amount
//                                 .toString(),
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<TransactionDTO> convertList(List<TransactionDTO> list, bool showIncome) {
//     return list
//         .where((element) => showIncome
//             ? !element.category!.isSpending
//             : element.category!.isSpending)
//         .toList();
//   }

//   List<TransactionModel> convertList2(
//       List<TransactionModel> list, bool showIncome) {
//     return list
//         .where((element) => showIncome
//             ? !element.category!.isSpending
//             : element.category!.isSpending)
//         .toList();
//   }

//   Map<String, double> setDataMap(List<TransactionDTO> list) {
//     Map<String, double> dataMap = {};
//     list.forEach((element) {
//       if (!dataMap.containsKey(element.category!.name)) {
//         dataMap.addAll({element.category!.name: element.amount!.toDouble()});
//       } else {
//         dataMap.update(
//           element.category!.name,
//           (value) => value + element.amount!.toDouble(),
//         );
//       }
//     });
//     return dataMap;
//   }

//   List<Color> setColorList(List<TransactionDTO> list) {
//     List<Color> listColor = [];
//     list.forEach((element) {
//       if (!listColor.contains(Color(element.category!.colorValue!))) {
//         listColor.add(Color(element.category!.colorValue!));
//       }
//     });
//     return listColor;
//   }
// }

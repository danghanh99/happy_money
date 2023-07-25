import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/components/pie_chart/custom_chart_values_options.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../components/pie_chart/custom_legend_options.dart';
import '../../components/pie_chart/custom_pie_chart.dart';
import 'components/toggle_line.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Flutter": 5,
      "React": 3,
      "Xamarin": 2,
      "Ionic": 2,
      "Flutter2": 5,
      "React2": 3,
      "Xamarin2": 2,
      "Ionic2": 2,
      "Flutter33": 5,
      "React33": 3,
      "Xamarin33": 2,
      "Ionic33": 2,
      "Flutter233": 5,
      "React233": 3,
      "Xamarin233": 2,
      "Ionic233": 2,
    };
    final colorList = <Color>[
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.greenAccent,
      Colors.grey,
      Colors.pink,
      Colors.white38,
      Colors.greenAccent,
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.greenAccent,
      Colors.grey,
      Colors.pink,
      Colors.white38,
      Colors.greenAccent,
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 242, 242),
      body: Scrollbar(
        isAlwaysShown: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
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
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Income",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "+4.000.000 d",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Spending",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "-2.000.000 d",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Surplus",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "2.000.000 d",
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
                PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 300),
                  chartRadius: 250.w,
                  colorList: colorList,
                  initialAngleInDegree: 0,
                  chartType: ChartType.disc,
                  ringStrokeWidth: 100.w,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValues: true,
                    // showChartValuesOutside: true,
                  ),
                  legendOptions: const LegendOptions(
                    showLegends: false,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 50.sp,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "Electric",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "500.000 d",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

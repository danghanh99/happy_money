import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ExpenseReportPage extends StatelessWidget {
  const ExpenseReportPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
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
                      initialLabelIndex: 1,
                      activeBgColor: [Colors.white],
                      activeFgColor: Colors.black,
                      inactiveBgColor: const Color.fromARGB(255, 245, 242, 242),
                      inactiveFgColor: Colors.grey[900],
                      totalSwitches: 2,
                      labels: ['Week', 'Month'],
                      onToggle: (index) {
                        print('switched to: $index');
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
                          Text('2,000,000đ',
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Text('Total spent this month',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 103, 101, 101),
                                    fontSize: 17.sp,
                                  )),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(' +9',
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                      )),
                                  Icon(
                                    Icons.percent,
                                    size: 18.sp,
                                  ),
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
                                  Container(
                                    width: 80.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0.sp)),
                                    ),
                                  ),
                                  const Divider(color: Colors.black),
                                  const Text("Last Month"),
                                ],
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 80.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0.sp)),
                                    ),
                                  ),
                                  const Divider(color: Colors.black),
                                  const Text("Last Month"),
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
                                          Text('Cloth',
                                              style: TextStyle(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          Text(
                                            '2.000.000 d',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '100%',
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

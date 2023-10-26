import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../components/format_money.dart';
import '../../../custom/const_icon.dart';

class BudgetItem extends StatefulWidget {
  BudgetItem({
    super.key,
    required this.fromDate,
    required this.toDate,
    required this.iconPath,
    required this.categoryName,
    required this.amount,
    required this.usedAmount,
  });

  DateTime fromDate;
  DateTime toDate;
  String iconPath;
  String categoryName;
  int amount;
  int usedAmount;
  @override
  State<BudgetItem> createState() => _BudgetItemState();
}

class _BudgetItemState extends State<BudgetItem> {
  double percent = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    percent = widget.usedAmount / widget.amount;

    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          right: 15.h,
          left: 15.h,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            DateFormat('dd/MM').format(widget.fromDate) +
                " - " +
                DateFormat('dd/MM').format(widget.toDate),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    child: Icon(
                      ConstIcon.getIconData(widget.iconPath),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.categoryName,
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    FormatMoney.formatTo(widget.amount, null),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "con lai " +
                        FormatMoney.formatTo(
                            widget.amount - widget.usedAmount, null),
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LinearPercentIndicator(
                barRadius: Radius.circular(5),
                padding: EdgeInsets.all(0),
                animation: true,
                width: 363.w,
                lineHeight: 15.h,
                center: Text(
                  (percent * 100).toStringAsFixed(1) + "%",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                percent: percent,
                progressColor: const Color.fromARGB(255, 94, 215, 98),
                backgroundColor: Color.fromARGB(255, 245, 242, 242),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

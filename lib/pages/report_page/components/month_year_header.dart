import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../custom/custom_toggle_switch.dart';

class MonthYearHeader extends StatefulWidget {
  MonthYearHeader({
    super.key,
    required this.currentDate,
    required this.onChangeDate,
    required this.onChangeMonthYear,
    required this.isFilterByYear,
  });

  DateTime currentDate;
  Function(DateTime) onChangeDate;
  Function(String) onChangeMonthYear;
  bool isFilterByYear;
  @override
  State<MonthYearHeader> createState() => _MonthYearHeaderState();
}

class _MonthYearHeaderState extends State<MonthYearHeader> {
  List<String> monYe = ['Month', 'Year'];
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
        CustomToggleSwitch(
          borderWidth: 2.sp,
          borderColor: const [
            Color.fromARGB(255, 242, 234, 234),
          ],
          minWidth: 130.w,
          minHeight: 35.h,
          fontSize: 16.0,
          initialLabelIndex: widget.isFilterByYear ? 1 : 0,
          activeBgColor: [
            Colors.green,
            Color.fromARGB(255, 88, 219, 32),
          ],
          activeFgColor: Colors.black,
          inactiveBgColor: Colors.white,
          inactiveFgColor: Colors.grey[900],
          totalSwitches: 2,
          labels: monYe,
          onToggle: (index) {
            widget.onChangeMonthYear.call(monYe[index!]);
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.currentDate = DateTime.now();
            });
            widget.onChangeDate.call(widget.currentDate);
          },
          child: Container(
            width: 40.w,
            child: Text(
              "Today",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

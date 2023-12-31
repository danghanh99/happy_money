import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../custom/custom_flutter_datetime_picker_plus.dart';

class SliderMonth extends StatefulWidget {
  SliderMonth({
    super.key,
    required this.currentDate,
    required this.onChangeDate,
    required this.isHidenMonth,
  });

  DateTime currentDate;
  Function(DateTime) onChangeDate;
  bool isHidenMonth;
  @override
  State<SliderMonth> createState() => _SliderMonthState();
}

class _SliderMonthState extends State<SliderMonth> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.arrow_back_ios),
        GestureDetector(
          onTap: () {
            CustomDatePicker.showMonthYearPicker(
              context,
              showTitleActions: true,
              minTime: DateTime(2022, 1, 1),
              maxTime: DateTime(2023, 12, 30),
              isHidenMonth: widget.isHidenMonth,
              onChanged: (datePick) {},
              onConfirm: (newDate) {
                // setState(() {
                //   widget.currentDate = newDate;
                // });
                widget.onChangeDate.call(newDate);
              },
              currentTime: widget.currentDate,
            );
          },
          child: Container(
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
                  DateFormat(widget.isHidenMonth ? 'yyyy' : 'MM/yyyy')
                      .format(widget.currentDate),
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 15.0.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        Transform.rotate(
          angle: 180 * pi / 180,
          child: const Icon(Icons.arrow_back_ios),
        ),
      ],
    );
  }
}

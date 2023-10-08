import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportHeader extends StatefulWidget {
  const ReportHeader({
    super.key,
    required this.total,
  });

  final int total;
  @override
  State<ReportHeader> createState() => _ReportHeaderState();
}

class _ReportHeaderState extends State<ReportHeader> {
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
          widget.total.toString() + " VND",
          style: TextStyle(
            fontSize: 17.0.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

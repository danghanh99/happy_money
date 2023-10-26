import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetHeader extends StatefulWidget {
  const BudgetHeader({
    super.key,
  });

  @override
  State<BudgetHeader> createState() => _BudgetHeaderState();
}

class _BudgetHeaderState extends State<BudgetHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 55.w,
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
              "Budget",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 55.w,
              height: 40.h,
              alignment: Alignment.centerRight,
              child: Text(
                "",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

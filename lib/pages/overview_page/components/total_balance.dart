import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total balance',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 103, 101, 101),
                      fontSize: 17.sp,
                    )),
                SizedBox(
                  width: 5.w,
                ),
                const Icon(
                  Icons.question_answer_rounded,
                  color: Color.fromARGB(255, 103, 101, 101),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
        Icon(
          Icons.remove_red_eye,
          size: 30.sp,
        ),
        const Spacer(),
        Icon(
          Icons.notifications_active,
          size: 30.sp,
        ),
      ],
    );
  }
}

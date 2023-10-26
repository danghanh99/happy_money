import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBudgetButton extends StatefulWidget {
  const AddBudgetButton({
    super.key,
  });

  @override
  State<AddBudgetButton> createState() => _AddBudgetButtonState();
}

class _AddBudgetButtonState extends State<AddBudgetButton> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle,
              color: Colors.green,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "Add Budget",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

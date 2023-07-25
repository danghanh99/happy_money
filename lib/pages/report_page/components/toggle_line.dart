import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleLine extends StatefulWidget {
  const ToggleLine({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<ToggleLine> createState() => _ToggleLineState();
}

class _ToggleLineState extends State<ToggleLine> {
  late bool isIncome;
  @override
  initState() {
    isIncome = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (!isIncome) {
              setState(() {
                isIncome = true;
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: 195.w,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isIncome
                      ? Colors.green
                      : const Color.fromARGB(255, 75, 71, 71),
                  width: 2.0.sp,
                ),
              ),
            ),
            child: Text(
              "Income",
              style: TextStyle(
                color: isIncome
                    ? Colors.green
                    : const Color.fromARGB(255, 75, 71, 71),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (isIncome) {
              setState(() {
                isIncome = false;
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: 195.w,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: !isIncome
                      ? Colors.green
                      : const Color.fromARGB(255, 75, 71, 71),
                  width: 2.0.sp,
                ),
              ),
            ),
            child: Text(
              "Spending",
              style: TextStyle(
                color: !isIncome
                    ? Colors.green
                    : const Color.fromARGB(255, 75, 71, 71),
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

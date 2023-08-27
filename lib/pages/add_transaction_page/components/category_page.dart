import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    this.child,
    required this.goToCategory,
  });

  final Widget? child;
  final Function goToCategory;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController groupController = new TextEditingController();
  DateTime currentDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    textEditingController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.rounded_corner_outlined,
          size: 50.sp,
        ),
        SizedBox(
          width: 10.w,
        ),
        GestureDetector(
          onTap: () {
            widget.goToCategory.call();
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0.sp,
                ),
              ),
            ),
            width: 335.w,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Select Category",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.sp),
                        child: Transform.rotate(
                          angle: 180 * pi / 180,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 22.sp,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:math';
import 'package:happy_money/pages/add_transaction_page/components/category_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionPage2 extends StatefulWidget {
  const AddTransactionPage2({
    super.key,
    this.child,
    required this.goToCategory,
  });

  final Widget? child;
  final Function goToCategory;

  @override
  State<AddTransactionPage2> createState() => _AddTransactionPage2State();
}

class _AddTransactionPage2State extends State<AddTransactionPage2> {
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0.sp),
            topRight: Radius.circular(16.0.sp)),
        color: const Color.fromARGB(255, 245, 242, 242),
      ),
      height: 800.h,
      child: Column(
        children: [
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0.sp),
                  topRight: Radius.circular(16.0.sp)),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "Add Transaction",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 380.h,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                bottom: 10.h,
                right: 15.h,
                left: 15.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.0.sp),
                          child: Text(
                            "VND",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Money",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [],
                              controller: textEditingController,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: textEditingController.clear,
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CategoryPage(
                    goToCategory: () {
                      widget.goToCategory.call();
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 48.w,
                        child: Icon(
                          Icons.note_add_outlined,
                          size: 30.sp,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Note",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w300,
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
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(1990, 3, 5),
                            maxTime: DateTime(2200, 6, 7),
                            onChanged: (datePick) {},
                            onConfirm: (newDate) {
                              setState(() {
                                currentDate = newDate;
                              });
                            },
                            currentTime: currentDate,
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Container(
                            width: 48.w,
                            child: Icon(
                              Icons.date_range_rounded,
                              size: 30.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          DatePicker.showDatePicker(
                                            context,
                                            showTitleActions: true,
                                            minTime: DateTime(1990, 3, 5),
                                            maxTime: DateTime(2200, 6, 7),
                                            onChanged: (datePick) {},
                                            onConfirm: (newDate) {
                                              setState(() {
                                                currentDate = newDate;
                                              });
                                            },
                                            currentTime: currentDate,
                                          );
                                        },
                                        child: Text(
                                          DateFormat('yyyy-MM-dd')
                                              .format(currentDate),
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
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
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 48.w,
                        child: Icon(
                          Icons.note_add_outlined,
                          size: 30.sp,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Wallet",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

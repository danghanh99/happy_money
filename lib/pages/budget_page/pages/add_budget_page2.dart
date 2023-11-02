import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_money/components/toast.dart';
import 'package:happy_money/data/hive_service/service/budget_dto_hive.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/budget_dto.dart';
import '../../add_transaction_page/add_page2/header.dart';
import '../components/budget_amount.dart';
import '../components/budget_category_page.dart';
import '../components/budget_note.dart';

class AddBudgetPage2 extends StatefulWidget {
  const AddBudgetPage2({
    super.key,
    this.child,
    required this.goToCategory,
    required this.budgetDTO,
    required this.goToWallet,
    required this.isEdit,
  });

  final Widget? child;
  final Function goToCategory;
  final Function goToWallet;
  final BudgetDTO budgetDTO;
  final bool isEdit;
  @override
  State<AddBudgetPage2> createState() => _AddBudgetPage2State();
}

class _AddBudgetPage2State extends State<AddBudgetPage2> {
  late DateTime currentDate = DateTime.now();
  bool? validateAmount;

  @override
  void initState() {
    super.initState();
    if (widget.budgetDTO.createdAt == null) {
      widget.budgetDTO.createdAt = currentDate;
    } else {
      currentDate = widget.budgetDTO.createdAt!;
    }
    if (widget.budgetDTO.fromDate == null) {
      widget.budgetDTO.fromDate =
          DateTime(currentDate.year, currentDate.month, 1);
    }
    if (widget.budgetDTO.toDate == null) {
      widget.budgetDTO.toDate =
          DateTime(currentDate.year, currentDate.month + 1, 0);
    }
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
          Header(
              title: "Add Budget",
              onSave: () {
                if (widget.budgetDTO.amount != null &&
                    widget.budgetDTO.amount! > 0 &&
                    widget.budgetDTO.category != null &&
                    widget.budgetDTO.wallet != null &&
                    widget.budgetDTO.createdAt != null &&
                    widget.budgetDTO.fromDate != null &&
                    widget.budgetDTO.toDate != null &&
                    widget.budgetDTO.fromDate!
                        .isBefore(widget.budgetDTO.toDate!)) {
                  widget.budgetDTO;
                  BudgetDTOHive.findToCreateOrUpdateBudgetDTO(widget.budgetDTO);

                  Navigator.pop(context);
                  CustomToast.show(
                    context,
                    message: "Created Budget",
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  );
                } else {
                  String message = "Cannot Add budget";
                  if (widget.budgetDTO.amount == null ||
                      widget.budgetDTO.amount! <= 0)
                    message = "Please Input Amount";

                  if (widget.budgetDTO.category == null)
                    message = "Please Select Category";

                  if (widget.budgetDTO.wallet == null)
                    message = "Please Select Wallet";

                  if (widget.budgetDTO.fromDate == null)
                    message = "Please Select From Date";

                  if (widget.budgetDTO.toDate == null)
                    message = "Please Select To Date";

                  if (widget.budgetDTO.fromDate!
                          .isAfter(widget.budgetDTO.toDate!) ||
                      widget.budgetDTO.fromDate == widget.budgetDTO.toDate)
                    message = "Please Select from date before to date";

                  CustomToast.show(
                    context,
                    message: message,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  );
                }
              }),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 440.h,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BudgetAmount(
                          budgetDTO: widget.budgetDTO,
                          setAmount: (value) {
                            setState(() {
                              widget.budgetDTO.amount = value;
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BudgetCategoryPage(
                    budgetDTO: widget.budgetDTO,
                    goToCategory: () {
                      widget.goToCategory.call();
                    },
                  ),
                  BudgetNote(
                      setNote: (value) {
                        setState(() {
                          widget.budgetDTO.note = value;
                        });
                      },
                      budgetDTO: widget.budgetDTO),
                  SizedBox(
                    height: 20.h,
                  ),
                  setDate1(),
                  SizedBox(
                    height: 20.h,
                  ),
                  setDate2(),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.goToWallet.call();
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 48.w,
                          child: Icon(
                            Icons.note_add_outlined, //wallet icon path
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
                                          widget.budgetDTO.wallet!.name,
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
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          widget.isEdit
              ? GestureDetector(
                  onTap: () {
                    // if (budgetDataSource.deletebudgetDTO(
                    //     widget.budgetDTO.uniqueKey)) {
                    //   Navigator.pop(context);
                    //   CustomToast.show(
                    //     context,
                    //     message: "Deleted budget",
                    //     gravity: ToastGravity.TOP,
                    //     backgroundColor: Colors.green,
                    //     textStyle: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   );
                    // } else {
                    //   CustomToast.show(
                    //     context,
                    //     message: "Delete budget Failed",
                    //     gravity: ToastGravity.TOP,
                    //     backgroundColor: Colors.red,
                    //     textStyle: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   );
                    // }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 350.w,
                    height: 50.h,
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                      color: Colors.red,
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 40.h,
          )
        ],
      ),
    );
  }

  Widget setDate1() {
    return Row(
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
                  widget.budgetDTO.fromDate = newDate;
                });
              },
              currentTime: widget.budgetDTO.fromDate,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(2022, 1, 1),
                              maxTime: DateTime(2032, 1, 1),
                              onChanged: (datePick) {},
                              onConfirm: (newDate) {
                                setState(() {
                                  widget.budgetDTO.fromDate = newDate;
                                });
                              },
                              currentTime: widget.budgetDTO.fromDate,
                            );
                          },
                          child: Text(
                            DateFormat('dd-MM-yyyy')
                                .format(widget.budgetDTO.fromDate!),
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
    );
  }

  Widget setDate2() {
    return Row(
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
                  widget.budgetDTO.toDate = newDate;
                });
              },
              currentTime: widget.budgetDTO.toDate,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(2022, 1, 1),
                              maxTime: DateTime(2032, 1, 1),
                              onChanged: (datePick) {},
                              onConfirm: (newDate) {
                                setState(() {
                                  widget.budgetDTO.toDate = newDate;
                                });
                              },
                              currentTime: widget.budgetDTO.toDate,
                            );
                          },
                          child: Text(
                            DateFormat('dd-MM-yyyy')
                                .format(widget.budgetDTO.toDate!),
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
    );
  }
}

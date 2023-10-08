import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_money/components/toast.dart';
import 'package:happy_money/data/hive_service/data_source/transaction_data_source.dart';
import 'package:happy_money/data/hive_service/service/transaction_dto_hive.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';
import 'package:happy_money/pages/add_transaction_page/add_page2/amount.dart';
import 'package:happy_money/pages/add_transaction_page/add_page2/header.dart';
import 'package:happy_money/pages/add_transaction_page/add_page2/note.dart';
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
    required this.transactionDTO,
    required this.goToWallet,
    required this.isEdit,
  });

  final Widget? child;
  final Function goToCategory;
  final Function goToWallet;
  final TransactionDTO transactionDTO;
  final bool isEdit;
  @override
  State<AddTransactionPage2> createState() => _AddTransactionPage2State();
}

class _AddTransactionPage2State extends State<AddTransactionPage2> {
  late DateTime currentDate = DateTime.now();
  bool? validateAmount;
  @override
  void initState() {
    super.initState();
    if (widget.transactionDTO.createdAt == null) {
      widget.transactionDTO.createdAt = currentDate;
    } else {
      currentDate = widget.transactionDTO.createdAt!;
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
          Header(onSave: () {
            if (widget.transactionDTO.amount != null &&
                widget.transactionDTO.amount! > 0 &&
                widget.transactionDTO.category != null &&
                widget.transactionDTO.wallet != null &&
                widget.transactionDTO.createdAt != null) {
              widget.transactionDTO;
              TransactionDTOHive.findToCreateOrUpdateTransactionDTO(
                  widget.transactionDTO);

              Navigator.pop(context);
            } else {
              String message = "Cannot Add Transaction";
              if (widget.transactionDTO.amount == null ||
                  widget.transactionDTO.amount! <= 0)
                message = "Please Input Amount";

              if (widget.transactionDTO.category == null)
                message = "Please Select Category";

              if (widget.transactionDTO.wallet == null)
                message = "Please Select Wallet";

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Amount(
                          transactionDTO: widget.transactionDTO,
                          setAmount: (value) {
                            setState(() {
                              widget.transactionDTO.amount = value;
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CategoryPage(
                    transactionDTO: widget.transactionDTO,
                    goToCategory: () {
                      widget.goToCategory.call();
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Note(
                      setNote: (value) {
                        setState(() {
                          widget.transactionDTO.note = value;
                        });
                      },
                      transactionDTO: widget.transactionDTO),
                  SizedBox(
                    height: 20.h,
                  ),
                  setDate(),
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
                                          widget.transactionDTO.wallet!.name,
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
                    if (TransactionDataSource.deleteTransactionDTO(
                        widget.transactionDTO.uniqueKey)) {
                      Navigator.pop(context);
                      CustomToast.show(
                        context,
                        message: "Deleted Transaction",
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.green,
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      CustomToast.show(
                        context,
                        message: "Delete Transaction Failed",
                        gravity: ToastGravity.TOP,
                        backgroundColor: Colors.red,
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    }
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

  Widget setDate() {
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
                                  currentDate = newDate;
                                  widget.transactionDTO.createdAt = currentDate;
                                });
                              },
                              currentTime: currentDate,
                            );
                          },
                          child: Text(
                            DateFormat('yyyy-MM-dd').format(currentDate),
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

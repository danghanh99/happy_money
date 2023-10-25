import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';

import '../../../custom/const_icon.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    required this.goToCategory,
    required this.transactionDTO,
  });

  final TransactionDTO transactionDTO;
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
        Padding(
          padding: EdgeInsets.only(bottom: 10.sp),
          child: Container(
            width: 50.w,
            height: 50.h,
            child: widget.transactionDTO.category == null
                ? Icon(
                    Icons.rounded_corner_outlined,
                    size: 30.sp,
                  )
                : Icon(
                    ConstIcon.getIconData(
                        widget.transactionDTO.category!.iconPath),
                    color: Color(widget.transactionDTO.category!.colorValue!),
                    size: 30.sp,
                  ),
          ),
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
                            widget.transactionDTO.category == null
                                ? "Select Category"
                                : widget.transactionDTO.category!.name,
                            style: TextStyle(
                              color: widget.transactionDTO.category == null
                                  ? Colors.grey
                                  : Colors.black,
                              fontSize: 22.sp,
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

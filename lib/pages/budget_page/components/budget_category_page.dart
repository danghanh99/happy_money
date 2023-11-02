import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../custom/const_icon.dart';
import '../../../data/models/budget_dto.dart';

class BudgetCategoryPage extends StatefulWidget {
  const BudgetCategoryPage({
    super.key,
    required this.goToCategory,
    required this.budgetDTO,
  });

  final BudgetDTO budgetDTO;
  final Function goToCategory;

  @override
  State<BudgetCategoryPage> createState() => _BudgetCategoryPageState();
}

class _BudgetCategoryPageState extends State<BudgetCategoryPage> {
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
            child: widget.budgetDTO.category == null
                ? Icon(
                    Icons.rounded_corner_outlined,
                    size: 30.sp,
                  )
                : Icon(
                    ConstIcon.getIconData(widget.budgetDTO.category!.iconPath),
                    color: Color(widget.budgetDTO.category!.colorValue!),
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
                            widget.budgetDTO.category == null
                                ? "Select Category"
                                : widget.budgetDTO.category!.name,
                            style: TextStyle(
                              color: widget.budgetDTO.category == null
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

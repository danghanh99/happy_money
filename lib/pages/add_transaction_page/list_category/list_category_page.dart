import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/models/category_dto.dart';
import 'package:happy_money/pages/add_transaction_page/list_category/components/category_item.dart';

import '../../../data/hive_service/data_source/category_data_source.dart';

class ListCategoryPage extends StatefulWidget {
  const ListCategoryPage({
    super.key,
    this.child,
    required this.goToAddPage,
    required this.setCategory,
  });

  final Widget? child;
  final Function goToAddPage;
  final Function(CategoryDTO) setCategory;

  @override
  State<ListCategoryPage> createState() => _ListCategoryPageState();
}

class _ListCategoryPageState extends State<ListCategoryPage> {
  List<CategoryDTO> listCategory = [];
  int? selectedCategoryIndexIncome;
  int? selectedCategoryIndexSpending;
  @override
  void initState() {
    super.initState();
    listCategory = CategoryDataSource.getListCategoryDTO();
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryDTO> listCategoryIncome =
        listCategory.where((element) => !element.isSpending).toList();
    List<CategoryDTO> listCategorySpending =
        listCategory.where((element) => element.isSpending).toList();
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
                      widget.goToAddPage.call();
                    },
                    child: Container(
                      width: 20.w,
                      child: Transform.rotate(
                        angle: pi / 180,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 22.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 20.w,
                      child: Icon(
                        Icons.search,
                        size: 22.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Spending",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listCategorySpending.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  name: listCategorySpending[index].name,
                  iconPath: listCategorySpending[index].iconPath,
                  checked: selectedCategoryIndexSpending == index,
                  onTap: () {
                    setState(() {
                      selectedCategoryIndexSpending = index;
                    });
                    widget.setCategory.call(listCategorySpending[index]);
                    widget.goToAddPage.call();
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Income",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listCategoryIncome.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  name: listCategoryIncome[index].name,
                  iconPath: listCategoryIncome[index].iconPath,
                  checked: selectedCategoryIndexIncome == index,
                  onTap: () {
                    setState(() {
                      selectedCategoryIndexIncome = index;
                    });
                    widget.setCategory.call(listCategoryIncome[index]);
                    widget.goToAddPage.call();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

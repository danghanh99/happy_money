import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/models/category_dto.dart';
import 'package:happy_money/pages/setting_page/add_category_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../add_transaction_page/add_transaction_page.dart';
import '../add_transaction_page/list_category/components/category_item.dart';
import '../report_page/components/toggle_line.dart';
import 'category_item_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController groupController = new TextEditingController();
  DateTime currentDate = DateTime.now();
  late List<Widget> pages;

  int currentview = 0;
  bool showIncome = false;

  List<CategoryDTO> listCategory = [];
  int? selectedCategoryIndexIncome;
  int? selectedCategoryIndexSpending;

  @override
  void initState() {
    super.initState();
    textEditingController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<CategoryDTO>('CategoryDTOBox').listenable(),
        builder: (context, categoryDTOBox, widget) {
          List<CategoryDTO> listCategory = categoryDTOBox.values.toList();

          List<CategoryDTO> listCategoryIncome =
              listCategory.where((element) => !element.isSpending).toList();
          List<CategoryDTO> listCategorySpending =
              listCategory.where((element) => element.isSpending).toList();

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(),
              // color: const Color.fromARGB(255, 245, 242, 242),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp)),
                            color: const Color.fromARGB(255, 224, 221, 221),
                          ),
                          width: 80.w,
                          height: 40.h,
                          child: Text(
                            "Back",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 200.w,
                        height: 40.h,
                        child: Text(
                          "List Category",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          showMaterialModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0.sp),
                                      topRight: Radius.circular(16.0.sp))),
                              context: context,
                              builder: (context) => AddCategoryPage());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp)),
                            color: const Color.fromARGB(255, 224, 221, 221),
                          ),
                          width: 80.w,
                          height: 40.h,
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ToggleLine(
                    showIncome: showIncome,
                    changeToggle: () {
                      setState(() {
                        showIncome = !showIncome;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  showIncome
                      ? Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: listCategoryIncome.length,
                              itemBuilder: (context, index) {
                                return CategoryItem(
                                  colorValue:
                                      listCategoryIncome[index].colorValue,
                                  name: listCategoryIncome[index].name,
                                  iconPath: listCategoryIncome[index].iconPath,
                                  checked: selectedCategoryIndexIncome == index,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CategoryItemPage(
                                          categoryDTO:
                                              listCategoryIncome[index],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      : Expanded(
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: listCategorySpending.length,
                              itemBuilder: (context, index) {
                                return CategoryItem(
                                  colorValue:
                                      listCategorySpending[index].colorValue,
                                  name: listCategorySpending[index].name,
                                  iconPath:
                                      listCategorySpending[index].iconPath,
                                  checked:
                                      selectedCategoryIndexSpending == index,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CategoryItemPage(
                                          categoryDTO:
                                              listCategorySpending[index],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

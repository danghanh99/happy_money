import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:happy_money/data/models/category_dto.dart';
import '../../components/toast.dart';
import '../../custom/const_icon.dart';
import '../../custom/custom_icon.dart';
import '../../data/hive_service/data_source/category_data_source.dart';

class CategoryItemPage extends StatefulWidget {
  const CategoryItemPage({
    super.key,
    required this.categoryDTO,
    required this.initialIndex,
  });

  final CategoryDTO categoryDTO;
  final int initialIndex;
  @override
  State<CategoryItemPage> createState() => _CategoryItemPageState();
}

class _CategoryItemPageState extends State<CategoryItemPage> {
  List<CustomIcon> listCustomIcon = ConstIcon.getListIcons();
  TextEditingController textEditingController = new TextEditingController();
  ScrollController scrollController = new ScrollController();
  late Color currentColor;
  late int currentIndex;
  @override
  void initState() {
    currentColor = Color(widget.categoryDTO.colorValue!);
    textEditingController.text = widget.categoryDTO.name;
    currentIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(),
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
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
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
                      "Edit Category",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (textEditingController.value.text != "" ||
                          textEditingController.value.text.toString().length >
                              0) {
                        widget.categoryDTO.name =
                            textEditingController.value.text;
                        widget.categoryDTO.colorValue = currentColor.value;
                        widget.categoryDTO.iconPath =
                            listCustomIcon[currentIndex].name;
                        if (CategoryDataSource.editCategoryDTO(
                            widget.categoryDTO)) {
                          Navigator.pop(context);
                          CustomToast.show(
                            context,
                            message: "Edited Category",
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.green,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        } else {
                          CustomToast.show(
                            context,
                            message: "Edit Category Failed",
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.red,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        }
                      } else {
                        CustomToast.show(
                          context,
                          message: "Edit Category Failed",
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        color: const Color.fromARGB(255, 224, 221, 221),
                      ),
                      width: 80.w,
                      height: 40.h,
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 710.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: EdgeInsets.all(9.0.sp),
                              child: Icon(
                                listCustomIcon[currentIndex].iconData,
                                size: 30.sp,
                                color: currentColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: width - 80,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h, top: 15.h),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 23.sp,
                                ),
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: textEditingController.clear,
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: Icon(
                                        Icons.clear,
                                        size: 35.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: EdgeInsets.all(9.0.sp),
                              child: Icon(
                                FrinoIcons.f_cash__1_,
                                size: 30.sp,
                                color: widget.categoryDTO.isSpending
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            width: width - 70,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h, top: 15.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.categoryDTO.isSpending
                                        ? "Spending"
                                        : "Income",
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
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
                      ColorPicker(
                          displayThumbColor: true,
                          paletteType: PaletteType.hueWheel,
                          pickerAreaHeightPercent: 0.7,
                          colorPickerWidth: 300.w,
                          portraitOnly: false,
                          enableAlpha: false,
                          labelTypes: [],
                          pickerColor: currentColor,
                          onColorChanged: (color) {
                            setState(() {
                              currentColor = color;
                            });
                          }),
                      Container(
                        height: 300.h,
                        child: Scrollbar(
                          child: GridView.count(
                              controller: scrollController,
                              primary: false,
                              padding: EdgeInsets.all(5.sp),
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10,
                              crossAxisCount: 4,
                              childAspectRatio: 3 / 2,
                              children: listCustomIcon
                                  .asMap()
                                  .map((index, customIcon) => MapEntry(
                                      index,
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        },
                                        child: Container(
                                          width: 20.w,
                                          height: 10.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1.sp,
                                              color: index == currentIndex
                                                  ? currentColor
                                                  : Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0.sp)),
                                          ),
                                          child: Icon(
                                            customIcon.iconData,
                                            color: index == currentIndex
                                                ? currentColor
                                                : Colors.grey,
                                          ),
                                        ),
                                      )))
                                  .values
                                  .toList()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (CategoryDataSource.deleteCategoryDTO(
                      widget.categoryDTO.uniqueKey)) {
                    Navigator.pop(context);
                    CustomToast.show(
                      context,
                      message: "Deleted Category",
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    CustomToast.show(
                      context,
                      message: "Delete Category Failed",
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
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

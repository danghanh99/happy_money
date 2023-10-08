import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happy_money/data/models/category_dto.dart';
import '../../components/toast.dart';
import '../../data/hive_service/data_source/category_data_source.dart';

class CategoryItemPage extends StatefulWidget {
  const CategoryItemPage({
    super.key,
    required this.categoryDTO,
  });

  final CategoryDTO categoryDTO;
  @override
  State<CategoryItemPage> createState() => _CategoryItemPageState();
}

class _CategoryItemPageState extends State<CategoryItemPage> {
  TextEditingController textEditingController = new TextEditingController();
  late Color currentColor;
  @override
  void initState() {
    currentColor = Color(widget.categoryDTO.colorValue!);
    textEditingController.text = widget.categoryDTO.name;
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
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 50.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: width - 70,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 25.h),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 25.sp,
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
                  Icon(
                    widget.categoryDTO.isSpending
                        ? Icons.exposure_minus_1
                        : Icons.plus_one,
                    size: 50.sp,
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
                      padding: EdgeInsets.only(bottom: 20.h, top: 25.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  pickerAreaHeightPercent: 0.4,
                  colorPickerWidth: 300.w,
                  portraitOnly: true,
                  enableAlpha: false,
                  labelTypes: [],
                  pickerColor: currentColor,
                  onColorChanged: (color) {
                    setState(() {
                      currentColor = color;
                    });
                  }),
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

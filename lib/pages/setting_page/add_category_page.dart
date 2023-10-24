import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/toast.dart';
import '../../custom/const_icon.dart';
import '../../custom/custom_icon.dart';
import '../../data/hive_service/data_source/category_data_source.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({
    super.key,
  });

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  List<CustomIcon> listCustomIcon = ConstIcon.getListIcons();
  late String iconDataName;
  TextEditingController textEditingController = new TextEditingController();
  int _groupValue = -1;
  Color currentColor = Colors.white;
  @override
  void initState() {
    iconDataName = listCustomIcon[0].name;
    _groupValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                    "Add Category",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (textEditingController.value.text != "" ||
                          textEditingController.value.text.toString().length >
                              0) {
                        if (CategoryDataSource.addCategoryDTO(
                          textEditingController.value.text,
                          currentColor,
                          _groupValue == 0,
                          iconDataName,
                        )) {
                          Navigator.pop(context);
                          CustomToast.show(
                            context,
                            message: "Added Category",
                            gravity: ToastGravity.TOP,
                            backgroundColor: Colors.green,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        } else {
                          CustomToast.show(
                            context,
                            message: "Add Category Failed",
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
                          message: "Add Category Failed",
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.red,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                  padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 25.sp,
                    ),
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Name',
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
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 22.w),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        RadioListTile(
                          value: 0,
                          groupValue: _groupValue,
                          title: Text(
                            "Spending",
                            style: TextStyle(
                              fontSize: 22.sp,
                            ),
                          ),
                          onChanged: (newValue) =>
                              setState(() => _groupValue = newValue!),
                          activeColor: Colors.red,
                          selected: false,
                        ),
                        RadioListTile(
                          value: 1,
                          groupValue: _groupValue,
                          title: Text(
                            "Income",
                            style: TextStyle(
                              fontSize: 22.sp,
                            ),
                          ),
                          onChanged: (newValue) =>
                              setState(() => _groupValue = newValue!),
                          activeColor: Colors.red,
                          selected: false,
                        ),
                      ],
                    ),
                  ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

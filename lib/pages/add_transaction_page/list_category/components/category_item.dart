import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../custom/const_icon.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
    required this.name,
    required this.iconPath,
    required this.onTap,
    required this.checked,
    this.colorValue,
  });

  final String name;
  final String iconPath;
  final Function() onTap;
  final bool checked;
  final int? colorValue;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        widget.onTap.call();
      },
      child: Container(
        height: 80.h,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: EdgeInsets.all(9.0.sp),
                child: Icon(
                  ConstIcon.getIconData(widget.iconPath),
                  size: 30.sp,
                  color: widget.colorValue == null
                      ? Colors.white
                      : Color(widget.colorValue!),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Container(
              width: width - 80,
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
                      widget.name,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    widget.checked
                        ? Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                        : Text(""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

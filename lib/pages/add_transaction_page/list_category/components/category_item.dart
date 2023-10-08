import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
    required this.name,
    this.iconPath,
    required this.onTap,
    required this.checked,
  });

  final String name;
  final String? iconPath;
  final Function() onTap;
  final bool checked;

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
            Icon(
              Icons.home,
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

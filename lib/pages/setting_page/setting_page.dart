import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/pages/setting_page/category_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController textEditingController = new TextEditingController();
  TextEditingController groupController = new TextEditingController();
  DateTime currentDate = DateTime.now();
  late List<Widget> pages;

  int currentview = 0;

  @override
  void initState() {
    super.initState();
    textEditingController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(),
        color: const Color.fromARGB(255, 245, 242, 242),
      ),
      height: 800.h,
      child: Column(
        children: [
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Setting",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(),
                ),
              );
            },
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

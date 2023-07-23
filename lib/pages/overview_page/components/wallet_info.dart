import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletInfo extends StatelessWidget {
  const WalletInfo({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.sp),
              topLeft: Radius.circular(20.sp),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: 15.sp,
              left: 15.sp,
            ),
            child: Row(
              children: [
                Text('My wallet',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    )),
                const Spacer(),
                Text('Show all',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Divider(
            color: Color.fromARGB(255, 245, 242, 242),
            thickness: 2,
          ),
        ),
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20.sp),
              bottomLeft: Radius.circular(20.sp),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 15.sp,
              right: 15.sp,
              left: 15.sp,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.wallet,
                  size: 30,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text('Wallet',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 14, 73, 122),
                    )),
                const Spacer(),
                Text('2,500,000 d',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 14, 73, 122),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

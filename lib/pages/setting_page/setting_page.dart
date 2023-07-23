import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('setting'),
    );
  }
}

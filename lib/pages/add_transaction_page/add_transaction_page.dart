import 'package:happy_money/pages/add_transaction_page/list_category/list_category_page.dart';
import 'package:flutter/material.dart';
import 'components/add_transaction_page2.dart';

class AddTransactionPage extends StatefulWidget {
  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  int currentview = 0;
  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      AddTransactionPage2(
        goToCategory: () {
          setState(() {
            currentview = 1;
          });
        },
      ),
      ListCategoryPage(
        setCategory: (category) {},
        goToAddPage: () {
          setState(() {
            currentview = 0;
          });
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return pages[currentview];
  }
}

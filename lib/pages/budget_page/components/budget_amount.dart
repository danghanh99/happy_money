import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/budget_dto.dart';

class BudgetAmount extends StatefulWidget {
  const BudgetAmount({
    super.key,
    required this.setAmount,
    required this.budgetDTO,
  });

  final Function(int) setAmount;
  final BudgetDTO budgetDTO;
  @override
  State<BudgetAmount> createState() => _BudgetAmountState();
}

class _BudgetAmountState extends State<BudgetAmount> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    textEditingController.text = widget.budgetDTO.amount == null
        ? "0"
        : widget.budgetDTO.amount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0.sp),
            child: Text(
              "VND",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          width: 335.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Amount",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              TextField(
                onTapOutside: (event) {
                  if (textEditingController.text.length > 0) {
                    String value = textEditingController.text
                        .replaceAll(new RegExp(r','), '');
                    widget.setAmount.call(int.parse(value));
                  }
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    // locale: 'ko',
                    decimalDigits: 0,
                    symbol: '',
                  ),
                ],
                controller: textEditingController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: IconButton(
                    onPressed: textEditingController.clear,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

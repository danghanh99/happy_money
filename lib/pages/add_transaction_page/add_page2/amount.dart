import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';

class Amount extends StatefulWidget {
  const Amount({
    super.key,
    required this.setAmount,
    required this.transactionDTO,
  });

  final Function(int) setAmount;
  final TransactionDTO transactionDTO;
  @override
  State<Amount> createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    textEditingController.text = widget.transactionDTO.amount == null
        ? "0"
        : widget.transactionDTO.amount.toString();
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

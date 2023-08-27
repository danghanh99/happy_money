import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_money/data/models/transactionn_dto.dart';

class Note extends StatefulWidget {
  const Note({
    super.key,
    required this.setNote,
    required this.transactionDTO,
  });

  final Function(String) setNote;
  final TransactionDTO transactionDTO;
  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    if (widget.transactionDTO.note != null) {
      textEditingController.text = widget.transactionDTO.note!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48.w,
          child: Icon(
            Icons.note_add_outlined,
            size: 30.sp,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          width: 335.w,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: TextField(
              onTapOutside: (event) {
                if (textEditingController.text.length > 0) {
                  widget.setNote.call(textEditingController.text);
                }
              },
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
          ),
        ),
      ],
    );
  }
}

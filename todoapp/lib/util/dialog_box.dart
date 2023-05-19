import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback OnSave;
 final VoidCallback OnCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.OnSave,
      required this.OnCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Yeni bir görev ekle"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Ekle", onPressed: OnSave),
                SizedBox(
                  width: 8,
                ),
                MyButton(text: "İptal Et", onPressed: OnCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}

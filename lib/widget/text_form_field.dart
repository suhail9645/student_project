import 'package:flutter/material.dart';

import '../core/text_form_core.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: listInputTipe[index],
        controller: controllerList[index],
        style: const TextStyle(fontSize: 22),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            label: Text(listLabel[index],
                style: const TextStyle(color: Colors.black)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: 'Your ${listLabel[index]}',
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'This Field Is Required';
          }
          return null;
        },
      ),
    );
  }
}

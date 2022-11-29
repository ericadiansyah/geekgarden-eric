import 'package:flutter/material.dart';

Widget inputForm(String hint, TextEditingController? controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 15,
      ),
      Text(
        hint,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 40,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0, style: BorderStyle.none),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              focusColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        ),
      ),
    ],
  );
}

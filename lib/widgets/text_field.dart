import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thibiti/utils/constant_colors.dart';

Widget text_field({
  required String hintText,
  required IconData icon,
  required TextInputType textInputType,
  required int maxLines,
  required TextEditingController controller,
  required bool isObsecure,
  required bool enabled
}){
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: TextField(
      cursorColor: ConstantColors.mainColor,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      enabled: enabled,
      //style: TextStyle(),
      decoration: InputDecoration(
        labelText: hintText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: ConstantColors.textColor
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        hintStyle: TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ConstantColors.borderColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ConstantColors.mainColor)
        ),
        suffixIcon: enabled ? Icon(icon, color: ConstantColors.textColor,) : null,
        alignLabelWithHint: true
      ),
    ),
  );
}
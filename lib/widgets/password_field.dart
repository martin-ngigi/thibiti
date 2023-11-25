import 'package:flutter/material.dart';
import 'package:thibiti/utils/constant_colors.dart';

Widget password_field({
  required String hintText,
  required IconData icon,
  required TextInputType textInputType,
  required int maxLines,
  required TextEditingController controller,
  required bool enabled, ///for password purposes
  required BuildContext context,
  void Function(String value)? onTextChange,


}){
  // final appTheme = AppTheme.of(context);
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: TextField(
      onChanged: (value) => onTextChange!(value),
      obscureText: true,
      cursorColor: ConstantColors.mainColor,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      enabled: enabled,
      style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
          overflow: TextOverflow.ellipsis,
        // color: color
      ),
      decoration: InputDecoration(
          labelText: hintText,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          hintStyle:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
              overflow: TextOverflow.ellipsis,
              color: ConstantColors.textColor
            // color: color
          ),
          labelStyle:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
              overflow: TextOverflow.ellipsis,
             color: ConstantColors.textColor
            // color: color
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  BorderSide( color: ConstantColors.borderColor)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide(color: ConstantColors.mainColor),
          ),

          // suffixIcon: isObsecure ?  Icon(Icons.edit, color: Colors.black,) : Container(),

          suffixIcon: Icon(Icons.lock, color: ConstantColors.textColor),
          alignLabelWithHint: true,
          // fillColor: appTheme.isDark ? Colors.grey : Colors.white,
          // filled: true
      ),
    ),
  );
}
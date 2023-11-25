import 'package:flutter/material.dart';
import 'package:thibiti/utils/constant_colors.dart';
import 'package:thibiti/widgets/big_text.dart';

Widget custom_button({
  required String buttonName,
  required VoidCallback onTapMethod,
  required BuildContext context,
  Color backgroundColor = ConstantColors.mainColor,
  Color textColor = ConstantColors.whiteColor
}){
  return GestureDetector(
    onTap: onTapMethod,
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      // width: 280,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: BigText(
            text: buttonName
        ),
      ),
    ),

  );
}
import 'package:flutter/material.dart';
import 'package:horpao_point/config/colors.dart';

class AppButton extends StatelessWidget {
  final String buttonTxt;
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color buttonTxtColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double buttonTxtSize;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double elevation;

  const AppButton({
    Key? key,
    this.onPressed,
    this.buttonTxt = 'Button',
    this.buttonTxtColor = Colors.white,
    this.buttonColor = AppColorSets.backgroundBlueColor,
    this.prefixIcon,
    this.suffixIcon,
    this.buttonTxtSize = 18,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: padding,
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: buttonProperties(),
      ),
    );
  }

  Widget buttonProperties() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: prefixIcon != null,
          child: Icon(prefixIcon, color: Colors.white),
        ),
        Flexible(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              buttonTxt,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: buttonTxtColor,
                fontWeight: FontWeight.bold,
                fontSize: buttonTxtSize,
              ),
            ),
          ),
        ),
        Visibility(
          visible: suffixIcon != null,
          child: Icon(suffixIcon, color: Colors.white),
        ),
      ],
    );
  }
}

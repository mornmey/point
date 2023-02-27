import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:horpao_point/config/colors.dart';

class AppFormBuilderDropDown extends StatelessWidget {
  final String name;
  final List<DropdownMenuItem<dynamic>> items;
  final IconData? prefixIcon;
  final String? prefixText;
  final String? hintText;
  final void Function(dynamic)? onSaved;
  final void Function(dynamic)? onChange;
  final dynamic Function(dynamic)? valueTransformer;
  final InputBorder? inputBorder;
  final Widget? iconList;
  final TextStyle? hintStyle;
  final FormFieldValidator? validators;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;

  const AppFormBuilderDropDown(
      {Key? key,
      this.iconDisabledColor,
      this.iconEnabledColor,
      this.iconList,
      this.hintStyle,
      this.validators,
      required this.name,
      required this.items,
      this.prefixIcon,
      this.prefixText,
      this.hintText,
      this.onSaved,
      this.onChange,
      this.inputBorder,
      this.valueTransformer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: name,
      items: items,
      validator: validators,
      decoration: InputDecoration(
        // hintText: hintText,
        // labelText: hintText,
        label: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(text: hintText),
              TextSpan(
                text: validators != null ? " *" : "",
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        labelStyle: hintStyle,
        border: inputBorder,
        prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
        prefixText: prefixText,
        prefixStyle: const TextStyle(color: Colors.black, fontSize: 16),
      ),
      onSaved: onSaved,
      onChanged: onChange,
      valueTransformer: valueTransformer,
      icon: iconList,
      iconDisabledColor: iconDisabledColor ?? AppColorSets.backgroundGreyColor,
      iconEnabledColor: iconEnabledColor ?? AppColorSets.backgroundBlueColor,
    );
  }
}

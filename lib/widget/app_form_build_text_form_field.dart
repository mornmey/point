import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormBuilderTextFormField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final String? prefixText;
  final TextStyle? hintStyle;
  final IconData? icon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String?)? onFieldSubmitted;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(dynamic)? onChange;
  final Function(dynamic)? valueTransformer;
  final int? maxLength;
  final int? maxLines;
  final String? name;
  final bool enabled;
  final bool autofocus;
  final VoidCallback? onTap;
  final bool enableInteractiveSelection;
  final bool showCursor;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? inputBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusBorder;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextAlign textAlign;
  final bool? filled;
  final Color? filledColor;
  final TextStyle? errorStyle;
  final bool? obscureText;

  const AppFormBuilderTextFormField({
    Key? key,
    this.enableInteractiveSelection = true,
    this.initialValue,
    this.hintText,
    this.prefixText,
    this.icon,
    this.focusNode,
    this.controller,
    this.onFieldSubmitted,
    this.validators,
    this.inputFormatters = const [],
    this.textInputAction,
    this.keyboardType,
    this.onChange,
    this.valueTransformer,
    this.maxLength,
    this.maxLines = 1,
    this.name,
    this.enabled = true,
    this.autofocus = false,
    this.onTap,
    this.showCursor = true,
    this.suffixIcon,
    this.contentPadding,
    this.inputBorder,
    this.enabledBorder,
    this.focusBorder,
    this.floatingLabelBehavior,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.filled,
    this.filledColor,
    this.errorStyle,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      obscureText: obscureText ?? false,
      textAlign: textAlign,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      onTap: onTap,
      autofocus: autofocus,
      enabled: enabled,
      name: name ?? "",
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      validator: validators,
      decoration: InputDecoration(
        enabledBorder: enabledBorder,
        focusedBorder: focusBorder,
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
        prefixIcon: icon != null ? Icon(icon) : null,
        prefixText: prefixText,
        prefixStyle: const TextStyle(color: Colors.black, fontSize: 16),
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        floatingLabelBehavior: floatingLabelBehavior,
        filled: filled,
        fillColor: filledColor,
        errorStyle: errorStyle,
      ),
      onSubmitted: onFieldSubmitted,
      onChanged: onChange,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      valueTransformer: valueTransformer,
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }
}

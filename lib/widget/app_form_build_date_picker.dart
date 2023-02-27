import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormBuildDatePicker extends StatelessWidget {
  final DateTime? initialValue;
  final String? hintText;
  final String? prefixText;
  final TextStyle? hintStyle;
  final IconData? icon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(DateTime?)? onFieldSubmitted;
  final FormFieldValidator<DateTime>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Function(dynamic)? onChange;
  final Function(dynamic)? valueTransformer;
  final int? maxLength;
  final int? maxLines;
  final String? name;
  final bool enabled;
  final bool autofocus;
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
  final DatePickerEntryMode? initialEntryMode;
  final InputType inputType;
  final DateFormat dateFormat;
  const AppFormBuildDatePicker({
    Key? key,
    this.enableInteractiveSelection: true,
    this.initialValue,
    this.hintText,
    this.prefixText,
    this.icon,
    this.focusNode,
    this.controller,
    this.validators,
    this.onFieldSubmitted,
    this.inputFormatters: const [],
    this.textInputAction,
    this.onChange,
    this.valueTransformer,
    this.maxLength,
    this.maxLines = 1,
    this.name,
    this.enabled = true,
    this.autofocus = false,
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
    this.initialEntryMode,
    this.inputType = InputType.date,
    required this.dateFormat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      textAlign: textAlign,
      showCursor: showCursor,
      enableInteractiveSelection: enableInteractiveSelection,
      autofocus: autofocus,
      enabled: enabled,
      name: name ?? "",
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      validator: validators,
      onFieldSubmitted: onFieldSubmitted,
      initialEntryMode: initialEntryMode ?? DatePickerEntryMode.calendar,
      inputType: inputType,
      format: dateFormat,
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
      onChanged: onChange,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      valueTransformer: valueTransformer,
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }
}

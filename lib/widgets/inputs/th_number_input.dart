import 'package:flutter/material.dart';
import 'package:itmesh_flutter_shared/flutter_shared.dart';
import 'package:toohak/_toohak.dart';

class ThNumberInput extends StatelessWidget {
  const ThNumberInput({
    super.key,
    this.labelText,
    this.formFieldKey,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.required = false,
    this.maxLines,
    this.minLines,
    this.validator,
    this.enabled = true,
    this.initialValue,
    this.obscureText = false,
    this.onSubmit,
    this.suffixText,
    this.showDeleteIcon = true,
    this.tooltipMsg,
  });

  final String? labelText;
  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool required;
  final int? maxLines;
  final int? minLines;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final String? initialValue;
  final bool obscureText;
  final void Function()? onSubmit;
  final String? suffixText;
  final bool showDeleteIcon;
  final String? tooltipMsg;

  static const NonUniformBorder _shapeBorder = NonUniformBorder(
    leftWidth: 0.0,
    rightWidth: 0.0,
    topWidth: 0.0,
    bottomWidth: 2.0,
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(13),
      topRight: Radius.circular(13),
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(12),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ImNumberInput(
      labelText: labelText,
      enabled: enabled,
      onSubmit: onSubmit,
      formFieldKey: formFieldKey,
      onChanged: onChanged,
      focusNode: focusNode,
      controller: controller,
      textStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText2,
      ),
      errorStyle: ThTextStyles.paragraphP3Medium.copyWith(
        color: ThColors.statusColorDanger,
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: ThColors.statusColorDanger,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: ThColors.statusColorDanger,
        ),
      ),
      fillColor: ThColors.textFormBg,
      hintStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText4,
      ),
      labelStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText4,
      ),
      floatingLabelStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText4,
      ),
      enabledBorder: _shapeBorder,
      focusedBorder: _shapeBorder,
      border: _shapeBorder,
      focusColor: ThColors.ascentAscent,
      required: required,
      validator: validator,
      deleteIcon: const Icon(
        Icons.cancel,
        color: ThColors.textText3,
      ),
      initialValue: initialValue,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: obscureText,
      suffixText: suffixText,
      showDeleteIcon: showDeleteIcon,
      inputHeight: 52.0,
      finalHeight: 70.0,
      contentPadding: const EdgeInsets.all(16.0),
      suffixBoxDecoration: BoxDecoration(
        color: ThColors.backgroundBG1,
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      suffixTextStyle: ThTextStyles.paragraphP3Medium.copyWith(
        color: _getSuffixColor(context),
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Color _getSuffixColor(BuildContext context) {
    if (formFieldKey != null && formFieldKey!.currentState != null && !formFieldKey!.currentState!.isValid) {
      return ThColors.ascentAscent;
    }

    return ThColors.textText2;
  }

  Color _getBorderColor(BuildContext context) {
    if (formFieldKey != null && formFieldKey!.currentState != null && !formFieldKey!.currentState!.isValid) {
      return ThColors.ascentAscent;
    }

    return ThColors.ascentAscent;
  }
}

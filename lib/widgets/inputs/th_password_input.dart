import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class ThPasswordInput extends StatelessWidget {
  const ThPasswordInput({
    super.key,
    this.labelText,
    this.hintText,
    this.formFieldKey,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.required = false,
    this.validator,
    this.enabled = true,
    this.onSubmit,
    this.autofillHints,
  });

  final String? labelText;
  final String? hintText;
  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool required;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final void Function()? onSubmit;
  final List<String>? autofillHints;

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
    return ImPasswordInput(
      labelText: labelText,
      hintText: hintText,
      enabled: enabled,
      autofillHints: autofillHints,
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
      passwordNotVisibleIcon: const Icon(
        Icons.visibility_off_outlined,
        color: ThColors.textText4,
      ),
      passwordVisibleIcon: const Icon(
        Icons.visibility_outlined,
        color: ThColors.textText4,
      ),
      finalHeight: 70.0,
      contentPadding: const EdgeInsets.all(16.0),
    );
  }
}

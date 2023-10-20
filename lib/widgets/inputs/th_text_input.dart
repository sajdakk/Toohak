import 'package:flutter/material.dart';
import 'package:itmesh_flutter_shared/flutter_shared.dart';
import 'package:toohak/_toohak.dart';

class ThTextInput extends StatelessWidget {
  const ThTextInput({
    super.key,
    this.labelText,
    this.hintText,
    this.formFieldKey,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.isRequired = false,
    this.maxLines = 1,
    this.minLines,
    this.validator,
    this.loading = false,
    this.enabled = true,
    this.initialValue,
    this.obscureText = false,
    this.onSubmit,
    this.autofillHints,
    this.withoutSpaces = false,
    this.suffixText,
  });

  final String? labelText;
  final String? hintText;
  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool isRequired;
  final bool loading;
  final int? maxLines;
  final int? minLines;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final String? initialValue;
  final bool obscureText;
  final void Function()? onSubmit;
  final List<String>? autofillHints;
  final bool withoutSpaces;
  final String? suffixText;



  @override
  Widget build(BuildContext context) {
    return ImTextInput(
      maxLines: maxLines,
      minLines: minLines,
      labelText: labelText,
      hintText: hintText,
      enabled: enabled,
      autofillHints: autofillHints,
      withoutSpaces: withoutSpaces,
      suffixText: suffixText,
      onSubmit: onSubmit,
      obscureText: obscureText,
      initialValue: initialValue,
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
      fillColor: ThColors.textText1,
      hintStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText4,
      ),
      labelStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText4,
      ),
      floatingLabelStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText4,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: ThColors.textFormBg,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: ThColors.textFormBg,
        ),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: ThColors.textFormBg,
        ),
      ),
      focusColor: ThColors.ascentAscent,
      isRequired: isRequired,
      validator: validator,
      finalHeight: 70.0,
      contentPadding: const EdgeInsets.all(16.0),
    );
  }
}

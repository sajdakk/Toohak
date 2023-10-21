import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class ThDropdownInput<T> extends StatelessWidget {
  const ThDropdownInput({
    Key? key,
    required this.values,
    required this.label,
    this.formFieldKey,
    this.initialValue,
    this.onChanged,
    this.customSorting,
    this.validator,
    this.isRequired = false,
    this.enabled = true,
    this.translateItemToString,
    this.translateItemToSubtitle,
  }) : super(key: key);

  final void Function(T? value)? onChanged;
  final String Function(T? element)? translateItemToString;
  final void Function(List<T> elements)? customSorting;
  final Set<T> values;
  final String label;
  final T? initialValue;
  final bool isRequired;
  final bool enabled;
  final GlobalKey<FormFieldState<T>>? formFieldKey;
  final FormFieldValidator<T>? validator;
  final String Function(T? element)? translateItemToSubtitle;

  @override
  Widget build(BuildContext context) {
    return ImDropdownInput(
      enabled: enabled,
      initialValue: initialValue,
      formFieldKey: formFieldKey,
      onChanged: onChanged,
      textStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText2,
      ),
      errorStyle: ThTextStyles.paragraphP3Medium.copyWith(
        color: ThColors.statusColorDanger,
      ),
      labelStyle: ThTextStyles.textCategory.copyWith(
        color: ThColors.textText4,
      ),
      isRequired: isRequired,
      validator: validator,
      label: label,
      values: values,
      backgroundColor: ThColors.backgroundBG1,
      dropdownColor: ThColors.backgroundBG2,
      dropdownDecoration: BoxDecoration(
        color: ThColors.backgroundBG1,
        border: Border.all(
          color: ThColors.ascentAscent,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      expandDropdownIcon: const Icon(
        Icons.expand_more,
        color: ThColors.textText3,
      ),
      subtitleStyle: ThTextStyles.paragraphP3Medium.copyWith(
        color: ThColors.textText2,
      ),
      translateItemtoString: translateItemToString,
      translateItemtoSubtitle: translateItemToSubtitle,
      titleStyle: ThTextStyles.paragraphP3Medium.copyWith(
        color: ThColors.textText2,
      ),
      customSorting: customSorting,
      inputHeight: 52.0,
      finalHeight: 70.0,
      contentPadding: const EdgeInsets.all(16.0),
    );
  }
}

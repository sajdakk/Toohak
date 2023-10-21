import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class ThCheckboxInput extends StatelessWidget {
  const ThCheckboxInput({
    super.key,
    required this.label,
    required this.formFieldKey,
    this.onChanged,
    this.checkRequired = false,
    this.enabled = true,
    this.initialValue = false,
  });

  final String label;
  final GlobalKey<FormFieldState<bool>>? formFieldKey;
  final ValueChanged<bool>? onChanged;
  final bool checkRequired;
  final bool enabled;
  final bool? initialValue;

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formFieldKey,
      validator: (bool? value) {
        if (checkRequired && (value == null || value == false)) {
          return 'Required field';
        }

        return null;
      },
      initialValue: initialValue ?? false,
      builder: (FormFieldState<bool> field) {
        return _buildBody(field, context);
      },
    );
  }

  Widget _buildBody(FormFieldState<bool> field, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (enabled == false) {
                    return;
                  }

                  final bool value = !field.value!;
                  field.didChange(value);
                  onChanged?.call(value);
                },
                behavior: HitTestBehavior.translucent,
                child: _buildCheckbox(field, context),
              ),
              if (field.hasError)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Text(
                    field.errorText!,
                    style: ThTextStyles.paragraphP3Medium.copyWith(
                      color: ThColors.statusColorDanger,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox(FormFieldState<bool> field, BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          child: BhCheckbox(
            value: field.value ?? false,
            onChanged: (bool? value) {
              if (enabled == false) {
                return;
              }

              value ??= true;
              field.didChange(value);
              onChanged?.call(value);
            },
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          label,
          style: ThTextStyles.textCategory.copyWith(
            color: ThColors.textText2,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toohak/_toohak.dart';

class ThRawInput extends StatelessWidget {
  const ThRawInput({
    super.key,
    this.labelText,
    this.hintText,
    this.formFieldKey,
    this.onChanged,
    this.focusNode,
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
    this.showShadow = false,
    this.suffixText,
  });

  final String? labelText;
  final String? hintText;
  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
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
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: showShadow
              ? <BoxShadow>[
                  BoxShadow(
                    color: const Color(0xffA4B4DA).withOpacity(0.1),
                    blurRadius: 24,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 72.0,
              child: TextFormField(
                mouseCursor: MouseCursor.defer,
                style: ThTextStyles.headlineH4Regular.copyWith(
                  color: ThColors.textText4,
                ),
                autofillHints: autofillHints,
                initialValue: initialValue,
                minLines: minLines ?? 1,
                maxLines: maxLines,
                validator: (value) {
                  if (isRequired && (value == null || value.isEmpty)) {
                    return 'Required field';
                  }

                  if (validator != null) {
                    return validator!(value);
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                enabled: enabled,
                onFieldSubmitted: (String value) => onSubmit?.call(),
                focusNode: focusNode,
                onChanged: (String? value) {
                  if (onChanged != null && value != null) {
                    onChanged!(value);
                  }
                },
                key: formFieldKey,
                obscureText: obscureText,
                inputFormatters: withoutSpaces
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ]
                    : null,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.all(8),
                  suffixText: suffixText,
                  hintText: hintText,
                  focusColor: ThColors.ascentAscent,
                  labelStyle: ThTextStyles.headlineH4Regular.copyWith(
                    color: ThColors.textText4,
                  ),
                  floatingLabelStyle: ThTextStyles.headlineH4Regular.copyWith(
                    color: ThColors.textText4,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
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
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: ThColors.textFormBg,
                  alignLabelWithHint: false,
                  labelText: labelText,
                  hintStyle: ThTextStyles.headlineH4Regular.copyWith(
                    color: ThColors.textText5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

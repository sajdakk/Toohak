import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class QuestionDetailDialog extends StatefulWidget {
  const QuestionDetailDialog({
    Key? key,
    required this.questionParameters,
  }) : super(key: key);

  final QuestionParameters? questionParameters;

  static Future<QuestionParameters?> show({
    required BuildContext context,
    required QuestionParameters? question,
  }) {
    return showDialog<QuestionParameters?>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: false,
      routeSettings: const RouteSettings(name: ThRoutes.dialogRouteName),
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600.0,
              maxHeight: 575.0,
            ),
            child: QuestionDetailDialog(
              questionParameters: question,
            ),
          ),
        );
      },
    );
  }

  @override
  State<QuestionDetailDialog> createState() => _QuestionDetailDialogState();
}

class _QuestionDetailDialogState extends State<QuestionDetailDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState<String>> _questionKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<int>> _correctAnswerKey = GlobalKey<FormFieldState<int>>();
  final GlobalKey<FormFieldState<String>> _durationKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _answer1Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _answer2Key = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _hintKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<bool>> _doubleBoostKey = GlobalKey<FormFieldState<bool>>();

  File? file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: ThColors.backgroundBG1,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
              top: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(),
                const SizedBox(height: 16.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      ThTextInput(
                        initialValue: widget.questionParameters?.question,
                        isRequired: true,
                        formFieldKey: _questionKey,
                        labelText: 'Question *',
                        maxLines: null,
                      ),
                      const SizedBox(height: 8.0),
                      ThTextInput(
                        initialValue: widget.questionParameters?.answer1,
                        isRequired: true,
                        formFieldKey: _answer1Key,
                        labelText: 'Answer 1 *',
                        maxLines: null,
                      ),
                      const SizedBox(height: 8.0),
                      ThTextInput(
                        initialValue: widget.questionParameters?.answer2,
                        isRequired: true,
                        formFieldKey: _answer2Key,
                        labelText: 'Answer 2 *',
                        maxLines: null,
                      ),
                      const SizedBox(height: 8.0),
                      ThDropdownInput<int>(
                        values: const <int>{1, 2},
                        label: 'Correct answer *',
                        formFieldKey: _correctAnswerKey,
                        isRequired: true,
                        initialValue: widget.questionParameters?.correctAnswer,
                      ),
                      const SizedBox(height: 8.0),
                      ThTextInput(
                        initialValue: widget.questionParameters?.hint,
                        isRequired: true,
                        formFieldKey: _hintKey,
                        labelText: 'Hint',
                        maxLines: null,
                      ),
                      ThCheckboxInput(
                        label: 'Double boost',
                        formFieldKey: _doubleBoostKey,
                      ),
                      const SizedBox(height: 8.0),
                      ThNumberInput(
                        initialValue: widget.questionParameters?.durationInSec.toString(),
                        required: true,
                        formFieldKey: _durationKey,
                        labelText: 'Duration in sec *',
                      ),
                      const SizedBox(height: 32.0),
                      ThButton(
                        title: widget.questionParameters == null ? 'Add question' : 'Update question ',
                        onTap: () async => await _submit(context),
                        size: ThPrimaryButtonSize.large,
                        style: ThPrimaryButtonStyle.secondary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 66.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'template details',
          style: ThTextStyles.paragraphP3Medium.copyWith(
            color: ThColors.textText1,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: () => thRouter.pop(),
          child: const Icon(
            Icons.cancel_outlined,
            size: 30.0,
            color: ThColors.ascentAscent,
          ),
        ),
      ],
    );
  }

  Future<void> _submit(BuildContext context) async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    int? readingTimeMins = int.tryParse(_durationKey.currentState!.value!);

    if (readingTimeMins == null) {
      return;
    }


    QuestionParameters lessonParameters = QuestionParameters(
      currentQuestion: widget.questionParameters?.currentQuestion,
      question: _questionKey.currentState!.value!,
      answer1: _answer1Key.currentState!.value!,
      answer2: _answer2Key.currentState!.value!,
      correctAnswer: _correctAnswerKey.currentState!.value!,
      hint: _hintKey.currentState!.value!,
      durationInSec: readingTimeMins,
      doubleBoost: _doubleBoostKey.currentState!.value!,
    );

    thRouter.pop(lessonParameters);
  }
}

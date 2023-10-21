import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';

class BhCheckbox extends StatefulWidget {
  const BhCheckbox({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool value;
  final void Function(bool?)? onChanged;

  @override
  State<BhCheckbox> createState() => _BhCheckboxState();
}

class _BhCheckboxState extends State<BhCheckbox> {
  @override
  void didUpdateWidget(covariant BhCheckbox oldWidget) {
    isSelected = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  late bool isSelected = widget.value;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: isSelected,
      activeColor: ThColors.ascentAscent,
      side: const BorderSide(
        color: ThColors.textText5,
        width: 2.0,
      ),
      checkColor: Colors.white,
      onChanged: (bool? value) {
        isSelected = !isSelected;
        widget.onChanged?.call(isSelected);
        setState(() {});
      },
    );
  }
}

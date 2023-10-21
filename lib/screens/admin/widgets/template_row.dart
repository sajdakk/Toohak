import 'package:flutter/material.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/template_details/template_details_screen.dart';

class TemplateRow extends StatelessWidget {
  const TemplateRow({
    super.key,
    required this.template,
    required this.onDelete,
  });

  final GameTemplate template;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => thRouter.pushNamed(
        TemplateDetailsScreen.getRoute(id: template.id),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 22.0,
          bottom: 22.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ThColors.backgroundBG1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                template.name,
                style: ThTextStyles.headlineH3Regular.copyWith(
                  color: ThColors.textText2,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.delete_rounded,
                color: ThColors.textText2,
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

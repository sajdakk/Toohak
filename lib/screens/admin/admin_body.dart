import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toohak/_toohak.dart';
import 'package:toohak/screens/template_details/template_details_screen.dart';

import 'cubit/admin_cubit.dart';
import 'widgets/template_row.dart';

class AdminBody extends StatefulWidget {
  const AdminBody({
    super.key,
    required this.state,
  });

  final AdminLoadedState state;

  @override
  State<AdminBody> createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThButton(
            title: 'Stwórz nowy quiz',
            onTap: () => thRouter.pushNamed(
              TemplateDetailsScreen.getRoute(id: null),
            ),
            size: ThPrimaryButtonSize.large,
            style: ThPrimaryButtonStyle.primary,
          ),
          const SizedBox(height: 24.0),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final GameTemplate template = widget.state.templates[index];

                return TemplateRow(
                  template: template,
                  onDelete: () => thShowAlert(
                    context,
                    content: 'Are you sure, that you want to delete this template?',
                    onConfirm: () async {
                      AdminCubit cubit = context.read();
                      await cubit.deleteTemplate(template.id);
                    },
                  ),
                );
              },
              itemCount: widget.state.templates.length,
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16.0),
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

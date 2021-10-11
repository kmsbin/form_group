import 'package:flutter/material.dart';
import 'package:form_group/src/form_group_state.dart';

import 'form_group_controller.dart';

class FormGroup extends StatelessWidget {
  final Widget child;
  final FormGroupController formGroupController;

  FormGroup({
    Key? key, 
    this.child = const SizedBox(), 
    required this.formGroupController,
  });

  static FormGroupState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormGroupState>();
  }

  @override
  Widget build(BuildContext context) {
    return FormGroupState(
      formController: formGroupController,
      child: LayoutBuilder(
        builder: (context, _) {
          this.formGroupController.context = context;
          return child;
        }
      ),
    );
  }
}




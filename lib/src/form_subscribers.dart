import 'package:flutter/widgets.dart';
import 'package:form_group/src/adapters/form_adapter.dart';

class FormFieldSubscriber implements FormSubscriber {
  TextEditingController textEditingController;
  GlobalKey<FormFieldState> key;
  String fieldName;
  FormAdapter adapter;

  FormFieldSubscriber(this.key, {
    this.fieldName = "", 
    TextEditingController? textController,
    this.adapter = const FormStringAdapter() 
  }) : textEditingController = textController ?? TextEditingController();

  bool get validate => key.currentState?.validate() ?? false;

  get value {
    return adapter.format(textEditingController.text);
  }

  get reset => textEditingController.clear();
}

abstract class FormSubscriber {
  bool get validate;

  get fieldName;

  get value;

  get reset;
}
import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../form_group.dart';
import 'form_subscribers.dart';

class FormGroupController {
  Map<String, FormSubscriber> childrenSubscribers = {};
  BuildContext? context;


  Map<String, FormSubscriber> get childrenControllers => 
    FormGroupState.of(context!)?.childrenControllers ?? {};  

  String get submit {
    return "${childrenSubscribers.values.map((e) => e.value)}";
  }

  void clearAll() {
    childrenSubscribers.values.forEach((element) {
      try {
        element.reset();
      } catch (e) {
        print(e);
      }
    });
  }

  String get submitAsJson {
    final map = childrenSubscribers.map((key, value) => MapEntry(key, value.value));

    return json.encode(map);
  }

  FormGroupController();
}
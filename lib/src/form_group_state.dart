import 'package:flutter/widgets.dart';
import 'package:form_group/src/form_subscribers.dart';

import '../form_group.dart';

class FormGroupState extends InheritedWidget {
  final Map<String, FormSubscriber> _childrenControllers = {};
  final Set<FormSubscriber> subscribedChilds = {};

  final FormGroupController formController;

  final Widget child;
  FormGroupState({required this.child, required this.formController}) : super(child: child);

  unregister(FormSubscriber child) {
    _childrenControllers.remove(child.fieldName);
    formController.childrenSubscribers.remove(child.fieldName);
  }

  register(FormSubscriber child) {
    _childrenControllers[child.fieldName] = child;
    formController.childrenSubscribers[child.fieldName] = child;
  }

  fieldDidChange() {}

  Map<String, FormSubscriber> get childrenControllers => _childrenControllers; 


  static FormGroupState? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FormGroupState>());
  }

  @override
  bool updateShouldNotify(FormGroupState oldWidget) => true;
}
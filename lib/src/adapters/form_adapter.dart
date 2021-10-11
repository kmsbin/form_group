abstract class FormAdapter<T> {
  dynamic format(rawField);
}

class FormStringAdapter implements FormAdapter {
  final int doubleMax;

  const FormStringAdapter({this.doubleMax = 2});
  
  @override
  String format(rawField) {
    if (rawField is double)
      return rawField.toStringAsFixed(doubleMax); 
    return rawField.toString();
  }
}

class FormIntAdapter implements FormAdapter {
  const FormIntAdapter();

  @override
  int format(rawField) {
    return int.tryParse(rawField) ?? 0;
  }
}

class FormDoubleAdapter implements FormAdapter {
  final int doubleMax;

  const FormDoubleAdapter({this.doubleMax = 2});

  @override
  double format(rawField) {
    return double.tryParse(rawField.toStringAsFixed(doubleMax)) ?? 0;
  }
}

class FormBooleanAdapter implements FormAdapter {
  const FormBooleanAdapter();
  
  @override
  bool format(rawField) {
    return rawField;
  }
}
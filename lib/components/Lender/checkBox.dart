import 'package:flutter/material.dart';

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.labelType,
  }) : super(key: key);

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final LabelType labelType;

  @override
  Widget build(BuildContext context) {
    Widget labelWidget;
    final TextStyle textStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    if (labelType == LabelType.text) {
      labelWidget = Text(
        label,
        style: textStyle,
      );
    } else {
      labelWidget = TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: textStyle,
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      );
    }
    return Row(
      children: <Widget>[
        Checkbox(
          activeColor: Theme.of(context).colorScheme.inversePrimary,
          checkColor: Theme.of(context).colorScheme.primary,
          value: value,
          onChanged: (bool? newValue) {
            onChanged(newValue!);
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              debugPrint('Label has been tapped.');
            },
            child: labelWidget,
          ),
        ),
      ],
    );
  }
}

enum LabelType {
  text,
  textField,
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          activeColor: Theme.of(context).colorScheme.inversePrimary,
          checkColor: Theme.of(context).colorScheme.onSecondaryContainer,
          value: value,
          onChanged: (bool? newValue) {
            onChanged(newValue!);
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Label has been tapped.');
                },
            ),
          ),
        ),
      ],
    );
  }
}

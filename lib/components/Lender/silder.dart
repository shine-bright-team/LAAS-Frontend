import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SilderBar extends StatefulWidget {
  final bool isEnabled;
  const SilderBar({Key? key, required this.isEnabled}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SilderBarState createState() => _SilderBarState();
}

class _SilderBarState extends State<SilderBar> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color inactiveColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.5);

    return Row(
      children: [
        const SizedBox(width: 30),
        Text(
          "$_value%",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 150),
          child: Slider(
            min: 0.0,
            max: 100.0,
            activeColor: widget.isEnabled ? primaryColor : inactiveColor,
            inactiveColor: inactiveColor,
            value: _value,
            onChanged: widget.isEnabled
                ? (value) {
                    setState(() {
                      _value = (value / 5).round() *
                          5; // Ensures the value is a multiple of 5
                    });
                  }
                : null,
            divisions: 20, // To match the increments of 5 (100/5 = 20)
            label: _value.toString(),
          ),
        ),
        Text(
          "100%",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

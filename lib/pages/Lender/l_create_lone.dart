//FXH
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/checkBox.dart';
import 'package:laas/components/Lender/silder.dart';

class LCreateLoan extends StatefulWidget {
  const LCreateLoan({Key? key}) : super(key: key);

  @override
  State<LCreateLoan> createState() => _LCreateLoanState();
}

const List<String> list = <String>['per day', 'per month'];

class _LCreateLoanState extends State<LCreateLoan> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CreateLoan",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Amount Range",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Start",
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        fillColor: Theme.of(context).colorScheme.surfaceVariant,
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "-",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "End",
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        fillColor: Theme.of(context).colorScheme.surfaceVariant,
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
              Text(
                "Agreement",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
              const SizedBox(height: 17),
              SizedBox(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: LinkedLabelCheckbox(
                        label: 'Interest rate |',
                        value: _isSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected = newValue;
                          });
                        },
                        labelType: LabelType.text,
                      ),
                    ),
                    const SizedBox(width: 10),
                    DropdownButtons(
                      isEnabled: _isSelected,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 17),
              SilderBar(isEnabled: _isSelected),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownButtons extends StatefulWidget {
  final bool isEnabled;

  const DropdownButtons({Key? key, required this.isEnabled}) : super(key: key);

  @override
  State<DropdownButtons> createState() => _DropdownButtonsState();
}

class _DropdownButtonsState extends State<DropdownButtons> {
  int dropdownValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      height: 25,
      child: Padding(
        padding: const EdgeInsets.only(left: 1, right: 1),
        child: PopupMenuButton<int>(
          enabled: widget.isEnabled,
          color: Theme.of(context).colorScheme.onPrimary,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          offset: const Offset(0, 30),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            PopupMenuItem<int>(
              value: 0,
              child: Text(
                'per day',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Text(
                'per month',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ],
          onSelected: (value) {
            setState(() {
              dropdownValue = value;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surfaceVariant,
            ),
            child: Row(
              children: [
                Text(
                  dropdownValue == 0 ? 'per day' : 'per month',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  widget.isEnabled
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//FXH
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/check_box.dart';
import 'package:laas/components/Lender/silder.dart';

class LCreateLoan extends StatefulWidget {
  final ValueChanged<String> onPaymentOptionSelected;
  const LCreateLoan({Key? key, required this.onPaymentOptionSelected})
      : super(key: key);

  @override
  State<LCreateLoan> createState() => _LCreateLoanState();
}

const List<String> list = <String>['per day', 'per month'];
const List<String> paymentOptions = ['KbanK', 'SCB', 'PromptPay'];
String selectedPaymentOption = '';

class _LCreateLoanState extends State<LCreateLoan> {
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isTextFieldFilled = false;

  final startController = TextEditingController();
  final endController = TextEditingController();
  final agreementDetailsController = TextEditingController();
  final paymentNumberController = TextEditingController();
  final activeatleast = TextEditingController();
  final havebasesalary = TextEditingController();

  void onPaymentOptionSelected(String option) {
    setState(() {
      selectedPaymentOption = option;
    });
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    agreementDetailsController.dispose();
    paymentNumberController.dispose();
    super.dispose();
  }

  bool isFieldsFilled() {
    return startController.text.isNotEmpty &&
        endController.text.isNotEmpty &&
        agreementDetailsController.text.isNotEmpty &&
        paymentNumberController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    _isTextFieldFilled = isFieldsFilled();
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
                      controller: startController,
                      onChanged: (value) => setState(() {
                        _isTextFieldFilled = isFieldsFilled();
                      }),
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
                      controller: endController,
                      onChanged: (value) => setState(() {
                        _isTextFieldFilled = isFieldsFilled();
                      }),
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
                        value: _isSelected1,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected1 = newValue;
                          });
                        },
                        labelType: LabelType.text,
                      ),
                    ),
                    const SizedBox(width: 5),
                    LDropdownButtons(
                      isEnabled: _isSelected1,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SilderBar(isEnabled: _isSelected1),
              const SizedBox(height: 10),
              LinkedLabelCheckbox(
                label: 'Due within (months)',
                value: _isSelected2,
                onChanged: (bool newValue) {
                  setState(() {
                    _isSelected2 = newValue;
                  });
                },
                labelType: LabelType.textField,
              ),
              const SizedBox(height: 20),
              Text(
                "Additional Agreement",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: agreementDetailsController,
                decoration: InputDecoration(
                  labelText: "Agreement Details",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                  filled: true,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Payment channel",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
                width: double.infinity,
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 10, top: 10),
                            child: DropdownButton<String>(
                              hint: const Text("Select Payment Option"),
                              isExpanded: true,
                              value: selectedPaymentOption.isNotEmpty
                                  ? selectedPaymentOption
                                  : null,
                              onChanged: (value) {
                                setState(() {
                                  selectedPaymentOption = value!;
                                });
                                widget.onPaymentOptionSelected(value!);
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              items: paymentOptions.map((String option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  key: ValueKey<String>(option),
                                  child: Text(option),
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: paymentNumberController,
                decoration: InputDecoration(
                  labelText: "Payment Number",
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                  filled: true,
                ),
              ),
              const SizedBox(height: 100),
              createLoanButton(context, _isTextFieldFilled),
            ],
          ),
        ),
      ),
    );
  }
}

class LDropdownButtons extends StatefulWidget {
  final bool isEnabled;

  const LDropdownButtons({Key? key, required this.isEnabled}) : super(key: key);

  @override
  State<LDropdownButtons> createState() => _LDropdownButtonsState();
}

class _LDropdownButtonsState extends State<LDropdownButtons> {
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

Widget createLoanButton(BuildContext context, bool isTextFieldFilled) {
  Color buttonColor = Theme.of(context).colorScheme.primary;
  Color textColor = Theme.of(context).colorScheme.onPrimary;
  if (!isTextFieldFilled) {
    buttonColor = Theme.of(context).colorScheme.onSurface;
    textColor = Theme.of(context).colorScheme.primary;
  }

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: textColor,
      minimumSize: const Size.fromHeight(50),
      backgroundColor: buttonColor,
    ),
    onPressed: isTextFieldFilled && selectedPaymentOption.isNotEmpty
        ? () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Create Loan successfully')),
            );
          }
        : null,
    child: Text(
      "Create Loan",
      style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
    ),
  );
}

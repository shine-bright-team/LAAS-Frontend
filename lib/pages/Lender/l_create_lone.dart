//FXH

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laas/components/Lender/check_box.dart';
import 'package:laas/providers/authProvider.dart';
import 'package:laas/services/data/lone_contract/create_lone.dart';

class LCreateLoan extends ConsumerStatefulWidget {
  final ValueChanged<String> onPaymentOptionSelected;
  const LCreateLoan({Key? key, required this.onPaymentOptionSelected})
      : super(key: key);

  @override
  ConsumerState<LCreateLoan> createState() => _LCreateLoanState();
}

const List<String> list = ['per day', 'per month'];
const List<String> paymentOptions = ['KbanK', 'SCB', 'PromptPay'];

class _LCreateLoanState extends ConsumerState<LCreateLoan> {
  final _formKey = GlobalKey<FormState>();
  String selectedPaymentOption = '';
  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isActiveAtLeast = false;
  bool _isHaveBaseSaraly = false;
  bool ispermount = false;
  int dropdownValue = 0;
  double interest = 0.0;

  final startController = TextEditingController();
  final endController = TextEditingController();
  final agreementDetailsController = TextEditingController();
  final paymentNumberController = TextEditingController();
  final activeatleast = TextEditingController();
  final havebasesalary = TextEditingController();
  final due = TextEditingController();
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  void onPaymentOptionSelected(String option) {
    setState(() {
      selectedPaymentOption = option;
    });
  }

  @override
  void initState() {
    super.initState();
    startController.text = "";
    endController.text = "";
    agreementDetailsController.text = "";
    paymentNumberController.text = "";
    activeatleast.text = "";
    havebasesalary.text = "";
    due.text = "";
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    agreementDetailsController.dispose();
    paymentNumberController.dispose();
    activeatleast.dispose();
    havebasesalary.dispose();
    due.dispose();
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
    final counter = ref.watch(authProvider);
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color inactiveColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.5);
    Color buttonColor = Theme.of(context).colorScheme.primary;
    Color textColor = Theme.of(context).colorScheme.onPrimary;
    // if (!_isTextFieldFilled) {
    //   buttonColor = Theme.of(context).colorScheme.onSurface;
    //   textColor = Theme.of(context).colorScheme.primary;
    // }
    return Form(
      key: _formKey,
      child: Scaffold(
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
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'(^\d*\.?\d*)'))
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'LowestAmount.';
                          }
                        },
                        controller: startController,
                        onChanged: (value) => setState(() {
                          // _isTextFieldFilled = isFieldsFilled();
                        }),
                        decoration: InputDecoration(
                          labelText: "Start",
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          fillColor:
                              Theme.of(context).colorScheme.surfaceVariant,
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "-",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontSize,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        controller: endController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'(^\d*\.?\d*)'))
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'HighestAmount.';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() {}),
                        decoration: InputDecoration(
                          labelText: "End",
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          fillColor:
                              Theme.of(context).colorScheme.surfaceVariant,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).colorScheme.surfaceVariant,
                        ),
                        height: 25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 1, right: 1),
                          child: PopupMenuButton<int>(
                            enabled: _isSelected1,
                            color: Theme.of(context).colorScheme.onPrimary,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            offset: const Offset(0, 30),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<int>>[
                              PopupMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'per day',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 1,
                                child: Text(
                                  'per month',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                              ),
                            ],
                            onSelected: (value) {
                              setState(() {
                                dropdownValue = value;
                                if (value == 0) {
                                  ispermount = false;
                                }
                                if (value == 1) {
                                  ispermount = true;
                                }
                              });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    dropdownValue == 0
                                        ? 'per day'
                                        : 'per month',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Icon(
                                    _isSelected1
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Text(
                      "$interest%",
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
                        activeColor:
                            _isSelected1 ? primaryColor : inactiveColor,
                        inactiveColor: inactiveColor,
                        value: interest,
                        onChanged: _isSelected1
                            ? (value) {
                                setState(() {
                                  interest = (value / 5).round() *
                                      5; // Ensures the value is a multiple of 5
                                });
                              }
                            : null,
                        divisions:
                            20, // To match the increments of 5 (100/5 = 20)
                        label: interest.toString(),
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
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Theme.of(context).colorScheme.inversePrimary,
                      checkColor: Theme.of(context).colorScheme.primary,
                      value: _isSelected2,
                      onChanged: (newValue) {
                        setState(() {
                          _isSelected2 = !_isSelected2;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          enabled: _isSelected2,
                          decoration: InputDecoration(
                            labelText: 'Due within (months)',
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ).copyWith(
                              color: _isSelected2
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                            ),
                          ),
                          controller: due,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Target Borrower",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium!.fontSize,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Theme.of(context).colorScheme.inversePrimary,
                      checkColor: Theme.of(context).colorScheme.primary,
                      value: _isActiveAtLeast,
                      onChanged: (newValue) {
                        setState(() {
                          _isActiveAtLeast = !_isActiveAtLeast;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          enabled: _isActiveAtLeast,
                          decoration: InputDecoration(
                            labelText: 'Active at least (months)',
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ).copyWith(
                              color: _isActiveAtLeast
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                            ),
                          ),
                          controller: activeatleast,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Theme.of(context).colorScheme.inversePrimary,
                      checkColor: Theme.of(context).colorScheme.primary,
                      value: _isHaveBaseSaraly,
                      onChanged: (newValue) {
                        setState(() {
                          _isHaveBaseSaraly = !_isHaveBaseSaraly;
                        });
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'(^\d*\.?\d*)'))
                          ],
                          enabled: _isHaveBaseSaraly,
                          decoration: InputDecoration(
                            labelText: 'Have base salary (THB)',
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ).copyWith(
                              color: _isHaveBaseSaraly
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                            ),
                          ),
                          controller: havebasesalary,
                        ),
                      ),
                    ),
                  ],
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
                TextFormField(
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
                  height: 82,
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
                              child: Column(
                                children: [
                                  DropdownButtonFormField<String>(
                                    hint: const Text("Select Payment Option"),
                                    isExpanded: true,
                                    validator: (value) => value == null
                                        ? 'Required Payment Option.'
                                        : null,
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    items: paymentOptions.map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        key: ValueKey<String>(option),
                                        child: Text(option),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the payment number.';
                    }
                    return null;
                  },
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: textColor,
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: buttonColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        createlone(
                          startController.text,
                          endController.text,
                          interest,
                          ispermount,
                          due.text,
                          activeatleast.text,
                          havebasesalary.text,
                          agreementDetailsController.text,
                          selectedPaymentOption,
                          paymentNumberController.text,
                        ).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Create Loan successfully')),
                          );
                          counter.getUser();
                          context.go('/login');
                        });
                      } catch (err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Failed to Create Loan')),
                        );
                        rethrow;
                      }
                    }

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Create Loan successfully')),
                    // );
                  },
                  child: Text(
                    "Create Loan",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            Theme.of(context).textTheme.titleMedium!.fontSize),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

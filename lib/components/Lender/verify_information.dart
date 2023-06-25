import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:laas/components/Lender/kyc_waiting.dart';
import 'package:laas/providers/authProvider.dart';

class VerifyInformation extends ConsumerStatefulWidget {
  const VerifyInformation({super.key});

  @override
  ConsumerState<VerifyInformation> createState() => _VerifyInformationState();
}

class _VerifyInformationState extends ConsumerState<VerifyInformation> {
  final _formKey = GlobalKey<FormState>();
  final birthdate = TextEditingController();
  final address = TextEditingController();
  final idNumber = TextEditingController();

  DateTime? birthdateTime;
  DateTime now = DateTime.now();

  // String formattedDate = DateFormat("dd'-'MM'-'y", birthdate.text).toString();

  void pickbirthdate() async {
    try {
      final DateTime? calendar = await showDatePicker(
          context: context,
          initialDate: birthdateTime ?? DateTime.now(),
          firstDate: DateTime(1923),
          lastDate: DateTime.now());
      if (calendar != null) {
        birthdate.text =
            DateFormat().addPattern("dd'-'MM'-'y").format(calendar);
        setState(() {
          birthdateTime = calendar;
        });
      } else {
        birthdate.text = "";
        setState(() {
          birthdateTime = null;
        });
      }
      setState(() {
        now;
      });
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(authProvider);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const LinearProgressIndicator(
                    value: 1.0,
                  ),
                  const SizedBox(height: 35),
                  Text(
                    "Verify Customer Information",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headlineSmall!.fontSize,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Please fill your information",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: birthdate,
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Birthdate must be filled";
                            } else if (now.difference(birthdateTime!).inDays ~/
                                    365 <
                                18) {
                              return "You must be at least 18 years old";
                            }
                            return null;
                          },
                          onTap: pickbirthdate,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: pickbirthdate,
                              icon: Icon(
                                Icons.today,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            label: Text(
                              "Date of birth",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: address,
                          validator: (value) =>
                              value!.isEmpty ? "Address must be filled" : null,
                          decoration: InputDecoration(
                            label: Text(
                              "Address",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: idNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Identification number must be filled";
                            } else if (!RegExp(r'^\d{13}$').hasMatch(value)) {
                              return "Identification number must be 13 digits";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Identification number",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.surfaceVariant,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 50, right: 50),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.outlineVariant)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Back",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: FilledButton(
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate()) {
                            await counter
                                .uploadkyc(
                                    birthdate.text, address.text, idNumber.text)
                                .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const KycWaiting())));
                          }
                        } catch (err) {
                          rethrow;
                        }
                      },
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

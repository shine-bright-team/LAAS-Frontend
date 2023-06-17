//Tine
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laas/config/theme/custom_text_fied.dart';
import 'package:laas/providers/authProvider.dart';
import 'package:laas/services/auth/vaildate_email.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  var _title = '';
  // ignore: unused_field
  var _role = false;
  final _fname = TextEditingController();
  final _lname = TextEditingController();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isLoading = false;
  bool _isShowPassword = false;
  final _seletion = const ["Mr.", "Ms.", "Mrs."];
  final _roleseletion = const ["Borrwer", "Lender"];
  void setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void dispose() {
    _fname.dispose();
    _lname.dispose();
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(authProvider);
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 576),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text("LAAS",
                            style: Theme.of(context).textTheme.displayMedium),
                        Text("Register your account",
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 100,
                              child: DropdownButtonFormField<String>(
                                  dropdownColor: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  decoration:
                                      roundInput.copyWith(labelText: "Title"),
                                  selectedItemBuilder: (context) => _seletion
                                      .map((e) => Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            _title == "" ? '---' : e,
                                            textAlign: TextAlign.center,
                                          )))
                                      .toList(),
                                  items: _seletion
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                e,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (item) {
                                    _title = "$item";
                                  }),
                            ),
                            Container(
                              width: 133,
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: TextFormField(
                                validator: (value) => value!.isEmpty
                                    ? "Firstname must not empty."
                                    : null,
                                decoration:
                                    roundInput.copyWith(labelText: "Firstname"),
                                controller: _fname,
                              ),
                            ),
                            Container(
                              width: 133,
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: TextFormField(
                                validator: (value) => value!.isEmpty
                                    ? "Lastname must not empty."
                                    : null,
                                decoration:
                                    roundInput.copyWith(labelText: "Lastname"),
                                controller: _lname,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) => value!.isEmpty
                              ? "Username must not empty."
                              : null,
                          decoration:
                              roundInput.copyWith(labelText: "Username"),
                          controller: _username,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          validator: (value) => value!.isEmpty
                              ? "Email must not be empty."
                              : !validateEmail(value)
                                  ? "Uncorrect email formatted."
                                  : null,
                          decoration: roundInput.copyWith(labelText: "Email"),
                          controller: _email,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _password,
                          obscureText: !_isShowPassword,
                          validator: (value) => value!.isEmpty
                              ? "Password must not be empty."
                              : value != _confirmPassword.text
                                  ? "Passwords are not the same"
                                  : null,
                          decoration: roundInput.copyWith(
                              labelText: "Password",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isShowPassword = !_isShowPassword;
                                      });
                                    },
                                    icon: Icon(_isShowPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _confirmPassword,
                          obscureText: !_isShowPassword,
                          validator: (value) => value!.isEmpty
                              ? "Password must not be empty."
                              : value != _password.text
                                  ? "Passwords are not the same"
                                  : null,
                          decoration: roundInput.copyWith(
                              labelText: "Confirm Password",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isShowPassword = !_isShowPassword;
                                      });
                                    },
                                    icon: Icon(_isShowPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 576),
                          child: DropdownButtonFormField<String>(
                              dropdownColor: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              decoration:
                                  roundInput.copyWith(labelText: "Select Role"),
                              selectedItemBuilder: (context) => _roleseletion
                                  .map((e) => Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        e,
                                        textAlign: TextAlign.center,
                                      )))
                                  .toList(),
                              items: _roleseletion
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            e,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (item) {
                                // ignore: unrelated_type_equality_checks
                                if (e == 'Lender') {
                                  _role = true;
                                }
                                // ignore: unrelated_type_equality_checks
                                if (e == 'Borrwer') {
                                  _role = true;
                                }
                              }),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        FilledButton(
                          onPressed: () async {
                            try {
                              await counter.signup(
                                  _email.text,
                                  _title,
                                  _fname.text,
                                  _lname.text,
                                  _username.text,
                                  _password.text,
                                  _role);
                              if (_role) {
                                // ignore: use_build_context_synchronously
                                context.go("/l/createloan");
                              }
                            } catch (err) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(err.toString())));
                              setLoading(false);
                            }
                          },
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            padding: const EdgeInsets.all(10.00),
                          ),
                          child: Text(_isLoading ? "Loading" : "Register"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const SignInOptions(
                        //   isSignup: true,
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account ?"),
                        TextButton(
                            onPressed: () {
                              context.go("/login");
                            },
                            child: const Text("Login"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    ));
  }
}

class Testwa extends StatelessWidget {
  final items = const ["MR", "MS", "MRS"];

  const Testwa({super.key});
  @override
  Widget build(BuildContext context) => DropdownButtonFormField<String>(
      selectedItemBuilder: (context) => items.map((e) => Text(e)).toList(),
      items: _getItems(),
      onChanged: (item) {});

  List<DropdownMenuItem<String>> _getItems() => items
      .map((e) => DropdownMenuItem(
            value: e,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                e,
              ),
            ),
          ))
      .toList();
}

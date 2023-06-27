import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laas/config/theme/custom_text_fied.dart';
import 'package:laas/config/theme/custom_warpper.dart';
import 'package:laas/providers/authProvider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isShowPassword = false;
  bool _isLoading = false;
  bool fail = false;

  void setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Container(
                constraints: wrapperConstranints,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("LAAS",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                              Text("Login to your account",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) => value!.isEmpty
                              ? "Email must not be empty."
                              : fail
                                  ? "Incorrect username (or email) or password"
                                  : "Uncorrect email formatted.",
                          decoration: roundInput.copyWith(
                              labelText: "Username or Email"),
                          controller: _email,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: !_isShowPassword,
                          validator: (value) => value!.isEmpty
                              ? "Password must not be empty."
                              : null,
                          controller: _password,
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
                          height: 30,
                        ),
                        FilledButton(
                          onPressed: () async {
                            setLoading(true);
                            try {
                              await counter
                                  .login(_email.text, _password.text)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Login Success")));
                              });

                              setLoading(false);
                            } catch (err) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Login fail")));
                              rethrow;
                            }
                          },
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            padding: const EdgeInsets.all(10.00),
                          ),
                          child: Text(_isLoading ? "Loading" : "Login"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              context.push("/reset-password");
                            },
                            child: const Text("Forgot password ?")),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account ?"),
                        TextButton(
                            onPressed: () {
                              context.go("/register");
                            },
                            child: const Text("Register"))
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

import 'package:flutter/material.dart';
import '../components/custom_icon.dart';
import '../components/custom_text_field.dart';
import 'login_bottom_sheet.dart';

// ignore: must_be_immutable
class CreateAccountBottomSheet extends StatefulWidget {
  CreateAccountBottomSheet({super.key});

  @override
  State<CreateAccountBottomSheet> createState() =>
      _CreateAccountBottomSheetState();
}

class _CreateAccountBottomSheetState extends State<CreateAccountBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var courseController = TextEditingController();
  bool obscureText1 = false;
  bool obscureText2 = false;
  bool obscureText3 = true;
  bool obscureText4 = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Hello..'),
                  subtitle: const Text(
                    'Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.red,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailController,
                  hintText: 'info@examole.com',
                  labelText: 'Username/email',
                  obscureText: obscureText1,
                  suffixIcon: IconButton(
                    icon: Icon(obscureText1
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: () {
                      obscureText1 = !obscureText1;
                      setState(() {});
                    },
                  ),
                  validator: _emailValidator,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: courseController,
                  labelText: 'Course',
                  obscureText: obscureText2,
                  suffixIcon: IconButton(
                    icon: Icon(obscureText2
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: () {
                      obscureText2 = !obscureText2;
                      setState(() {});
                    },
                  ),
                  validator: _courseValidator,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: passwordController,
                  labelText: 'password',
                  obscureText: obscureText4,
                  suffixIcon: IconButton(
                    icon: Icon(obscureText4
                        ? Icons.lock_outline
                        : Icons.lock_open_rounded),
                    onPressed: () {
                      obscureText4 = !obscureText4;
                      setState(() {});
                    },
                  ),
                  validator: _passwordValidator,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: confirmPasswordController,
                  labelText: 'confirm password',
                  obscureText: obscureText3,
                  suffixIcon: IconButton(
                    icon: Icon(obscureText3
                        ? Icons.lock_outline
                        : Icons.lock_open_rounded),
                    onPressed: () {
                      obscureText3 = !obscureText3;
                      setState(() {});
                    },
                  ),
                  validator: _confirmPasswordValidator,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomIconButton(
                  color: Colors.black,
                  text: 'Register',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  colorText: Colors.yellow,
                  width: 300,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    //
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.yellow.shade100,
                              context: context,
                              builder: (context) => LoginBottomSheet());
                        },
                        child: const Text('Login',
                            style: TextStyle(color: Colors.red, fontSize: 15)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (value == null || value.isEmpty) {
      return "Please enter an email address";
    } else if (!emailValid.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    if (value.isNotEmpty && value != passwordController.text) {
      return "Passwords do not match";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }
}

String? _courseValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter course field";
  }
  return null;
}
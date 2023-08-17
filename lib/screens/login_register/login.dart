import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants/routes.dart';
import '../../constants/theme.dart';
import '../../services/fairebaseAuth.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import '../widgets/showToast.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  String? password;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: ListView(
              children: <Widget>[
                SizedBox(height: height * .2),
                Center(
                  child: Text('LOGIN', style: Themes().headingStyle),
                ),
                SizedBox(height: height * .05),
                customTextField(
                  hint: 'Email',
                  OnChanged: (value) => email = value,
                  color: scColor,
                ),
                SizedBox(height: height * .02),
                customTextField(
                  hint: 'Password',
                  obscureText: true,
                  OnChanged: (value) => password = value,
                  color: scColor,
                ),
                SizedBox(height: height * .05),
                customButton(
                  label: 'sign in',
                  on_tab: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => isLoading = true);
                      try {
                        await firebaseAuth()
                            .loginUser(email: email!, password: password!);
                        // ignore: use_build_context_synchronously
                        showToastt('login success');
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          homePageRoute,
                          (_) => false,
                        );
                      } on FirebaseAuthException catch (e) {
                        showToastt(e.message.toString());
                      } catch (e) {
                        showToastt(e.toString());
                      }
                      setState(() => isLoading = false);
                    }
                  },
                  color: initialColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'don\'t have account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .popAndPushNamed(registerPageRoute),
                      child: const Text(
                        'sign up',
                        style: TextStyle(color: scColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

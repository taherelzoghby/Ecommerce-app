import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/fairebaseAuth.dart';
import '../../constants/colors.dart';
import '../../constants/routes.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import '../widgets/showToast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class rigester extends StatefulWidget {
  const rigester({super.key});

  @override
  State<rigester> createState() => _rigesterState();
}

class _rigesterState extends State<rigester> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = '';
  String password = '';
  String name = '';
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          opacity: 0,
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: height * .15),
                const Center(
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: initialColor,
                    ),
                  ),
                ),
                SizedBox(height: height * .05),
                customTextField(
                  hint: 'Name',
                  OnChanged: (value) => name = value,
                  color: scColor,
                ),
                SizedBox(height: height * .02),
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
                SizedBox(height: height * .06),
                customButton(
                  label: 'sign up',
                  on_tab: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => isLoading = true);
                      try {
                        await firebaseAuth().create_user(
                          email: email,
                          password: password,
                          name: name,
                        );
                        // ignore: use_build_context_synchronously
                        showToastt('register success');
                        // ignore: use_build_context_synchronously
                        Navigator.of(context)
                            .pushReplacementNamed(loginPageRoute);
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
                      'already have an acount?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).popAndPushNamed(loginPageRoute),
                      child: const Text(
                        'sign in',
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

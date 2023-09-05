import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/blocs/authBloc/auth_bloc.dart';
import '../../widgets/showToast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants/routes.dart';
import '../../constants/theme.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';

// ignore: camel_case_types, must_be_immutable
class login extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  String? password;

  bool isLoading = false;

  login({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoadingLogin) {
            isLoading = true;
          } else if (state is LoadedLogin) {
            isLoading = false;
            Navigator.of(context).pushNamedAndRemoveUntil(
              homePageRoute,
              (route) => false,
            );
          } else if (state is ErrorLogin) {
            isLoading = false;
            showToastt(state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
                          BlocProvider.of<AuthBloc>(context).add(
                            LoginEvent(email: email!, password: password!),
                          );
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
          );
        },
      ),
    );
  }
}

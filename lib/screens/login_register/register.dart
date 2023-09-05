import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/blocs/authBloc/auth_bloc.dart';
import '../../constants/theme.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants/routes.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customTextField.dart';
import '../../widgets/showToast.dart';

// ignore: camel_case_types, must_be_immutable
class rigester extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = '';
  String password = '';
  String name = '';
  bool isLoading = false;

  rigester({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoadingRegister) {
              isLoading = true;
            } else if (state is LoadedRegister) {
              isLoading = false;
              Navigator.of(context).pushReplacementNamed(loginPageRoute);
            } else if (state is ErrorRegister) {
              isLoading = false;
              showToastt(state.message);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              opacity: 0,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: height * .15),
                    Center(
                      child: Text('SIGNUP', style: Themes().headingStyle),
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
                          BlocProvider.of<AuthBloc>(context).add(
                            RegisterEvent(
                              email: email,
                              password: password,
                              name: name,
                            ),
                          );
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
                          onPressed: () => Navigator.of(context)
                              .popAndPushNamed(loginPageRoute),
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
            );
          },
        ),
      ),
    );
  }
}

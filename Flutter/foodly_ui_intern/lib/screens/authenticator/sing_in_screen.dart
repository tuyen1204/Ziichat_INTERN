import 'package:flutter/material.dart';
import 'package:foodly_ui_intern/constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    "Welcome to",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          'Enter your Phone number or Email address \nfor sign in. ',
                      style: TextStyle(
                        color: bodyTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Create new account.',
                            style: TextStyle(color: primaryColor)),
                      ],
                    ),
                  ),
                ],
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: inputColor,
                      filled: true,
                      contentPadding: EdgeInsets.all(defaultPadding),
                      hintText: 'Phone number or Email address',
                    ),
                    onSaved: (String? value) {},
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

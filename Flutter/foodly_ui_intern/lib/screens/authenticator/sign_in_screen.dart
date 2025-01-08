import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_ui_intern/constants.dart';
import 'package:foodly_ui_intern/screens/authenticator/forgot_password_screen.dart';
import 'package:foodly_ui_intern/screens/home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$';

  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
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
            spacing: 24,
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
                        height: 1.4,
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
                key: _formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "Email address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        suffixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Icon(
                            Icons.mail,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }

                        if (!RegExp(emailPattern).hasMatch(value)) {
                          return 'It must be a valid email';
                        }
                        return null;
                      },
                      onSaved: (String? value) {},
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    TextFormField(
                      obscureText: _showPassword, //* Convert the text to *****
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          //* Action not animations material
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      onSaved: (String? value) {},
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }

                        if (value.length < 8) {
                          return 'Password must be longer than 8 characters';
                        }

                        if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Digit is missing';
                        }

                        // if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                        //   return 'Special character is missing';
                        // }

                        return null;
                      },
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black87),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //* Validate onPress
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      },
                      child: Text("Sign in".toUpperCase()),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                    Column(
                      spacing: 12,
                      children: dataSocials.map((data) {
                        //* Map data into column
                        return SocialButton(
                          nameButton: data['name']!,
                          colorButton: Color(int.parse(
                              data['color']!.substring(1),
                              radix: 16)),
                          imgButton: data['img']!,
                          onPressButton: () {},
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.nameButton,
    required this.colorButton,
    required this.onPressButton,
    required this.imgButton,
  });

  final String nameButton;
  final Color colorButton;
  final String imgButton;
  final Function() onPressButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        child: Row(
          spacing: 12,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: SvgPicture.asset(
                imgButton,
                height: 20,
                width: 20,
              ),
            ),
            Expanded(
              child: Text(
                nameButton.toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}

List<Map<String, String>> dataSocials = [
  {
    'name': 'Connect with Facebook',
    'color': '#FF395998',
    'img': "assets/icons/facebook.svg",
    'url': 'https://www.facebook.com/?locale=vi_VN',
  },
  {
    'name': 'Connect with Google',
    'color': '#FF4285F4',
    'img': "assets/icons/google.svg",
    'url': 'https://www.google.com/?hl=vi',
  },
  // Add more data as needed
];

import 'package:eazeal/config/constants.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const loginVectorPath = "assets/images/login-vector.svg";

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "LOGIN",
                    style: textTheme.headline1?.copyWith(color: primaryColor),
                  ),
                  const SizedBox(height: 60),
                  SvgPicture.asset(
                    loginVectorPath,
                    width: 171,
                    height: 177,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    onPressed: () {},
                    text: "Login",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

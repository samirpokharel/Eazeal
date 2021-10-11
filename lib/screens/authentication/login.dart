import 'package:eazeal/config/constants.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:eazeal/services/validation_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const loginVectorPath = "assets/images/login-vector.svg";

class Login extends StatefulWidget {
  static const String routeName = "/login";
  final void Function() toggleScreen;

  const Login({Key? key, required this.toggleScreen}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _fromKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _fromKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fromKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: "Email"),
                    validator: (val) => ValidationService.validateEmail(val),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                    validator: (val) => ValidationService.validatePassword(val),
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
                    text: "Login",
                    buttonStatus: ButtonStatus.idle,
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        _fromKey.currentState?.save();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  AuthTogleButton(
                    buttonTitle: "don’t have an account ?",
                    actionTitle: "sign up",
                    onTap: widget.toggleScreen,
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

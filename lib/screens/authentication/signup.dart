import 'package:eazeal/config/constants.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:eazeal/services/validation_services.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  static const String routeName = "/signup";

  const Signup({Key? key, required this.toggleScreen}) : super(key: key);

  final void Function() toggleScreen;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _conformPasswordController;
  late TextEditingController _fullNameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneNumberController;
  late GlobalKey<FormState> _fromKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _fullNameController = TextEditingController();
    _conformPasswordController = TextEditingController();
    _addressController = TextEditingController();
    _phoneNumberController = TextEditingController();

    _fromKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _conformPasswordController.dispose();
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
                    "SIGNUP",
                    style: textTheme.headline1?.copyWith(color: primaryColor),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(hintText: "Full Name"),
                    validator: (val) => ValidationService.validateEmail(val),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: "Email"),
                    validator: (val) => ValidationService.validateEmail(val),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(hintText: "Address"),
                    validator: (val) => ValidationService.validateEmail(val),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(hintText: "Phone Number"),
                    validator: (val) => ValidationService.validateEmail(val),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                    validator: (val) => ValidationService.validatePassword(val),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _conformPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Conform Password",
                    ),
                    validator: (val) => ValidationService.validatePassword(val),
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    text: "Signup",
                    buttonStatus: ButtonStatus.idle,
                    onPressed: () {
                      if (_fromKey.currentState!.validate()) {
                        _fromKey.currentState?.save();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  AuthTogleButton(
                    buttonTitle: "Already have an account ?",
                    actionTitle: "Login",
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

import 'package:eazeal/config/constants.dart';
import 'package:eazeal/controller/auth_controller.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:eazeal/services/validation_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = "/forgotPassword";

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  static String loginVectorPath = "assets/images/forgot-password-vector.svg";
  late TextEditingController _emailController;
  late GlobalKey<FormState> _fromKey;

  @override
  void initState() {
    _emailController = TextEditingController();
    _fromKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fromKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer(
      builder: (context, watch, child) {
        final authNotifierController = watch(authControllerProvider.notifier);
        final authStateController = watch(authControllerProvider);

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
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: primaryColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "FORGOT PASSWORD",
                            style: textTheme.headline2?.copyWith(
                              color: primaryColor,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 70),
                      SvgPicture.asset(
                        loginVectorPath,
                        width: 227,
                        height: 151,
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(hintText: "Email"),
                        validator: (val) =>
                            ValidationService.validateEmail(val),
                      ),
                      const SizedBox(height: 20),
                      AuthButton(
                        text: "Send Request",
                        buttonStatus:
                            authStateController.status == AuthStatus.loading
                                ? ButtonStatus.busy
                                : ButtonStatus.idle,
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            authNotifierController.forgotPassowrd(
                              _emailController.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:eazeal/config/constants.dart';
import 'package:eazeal/controller/auth_controller.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:eazeal/services/validation_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../providers.dart';

enum TokenReciverType { signUpConformation, forgotPasswordConformation, none }

class TokenReciver extends StatefulWidget {
  final TokenReciverType? tokenReciverType;
  static const String routeName = "/tokenReciver";

  const TokenReciver({Key? key, this.tokenReciverType = TokenReciverType.none})
      : super(key: key);

  @override
  State<TokenReciver> createState() => _TokenReciverState();
}

class _TokenReciverState extends State<TokenReciver> {
  static String loginVectorPath = "assets/images/forgot-password-vector.svg";
  late TextEditingController _tokenController;
  late TextEditingController _passwordController;
  late TextEditingController _conformPasswordController;
  late GlobalKey<FormState> _fromKey;

  @override
  void initState() {
    _tokenController = TextEditingController();
    _passwordController = TextEditingController();
    _conformPasswordController = TextEditingController();
    _fromKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _tokenController.dispose();
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
                            widget.tokenReciverType ==
                                    TokenReciverType.forgotPasswordConformation
                                ? "Reset Password"
                                : "TOKEN",
                            style: textTheme.headline2?.copyWith(
                              color: primaryColor,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),

                      const SizedBox(height: 70),
                      // SvgPicture.asset(
                      //   loginVectorPath,
                      //   width: 227,
                      //   height: 151,
                      // ),
                      // const SizedBox(height: 40),
                      TextFormField(
                        controller: _tokenController,
                        decoration: const InputDecoration(hintText: "Token"),
                        validator: (val) {
                          return ValidationService.notEmptyValidation(
                            val,
                            "token",
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      if (widget.tokenReciverType ==
                          TokenReciverType.forgotPasswordConformation)
                        TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(hintText: "New Passowrd"),
                          validator: (val) {
                            return ValidationService.validatePassword(val);
                          },
                        ),
                      const SizedBox(height: 20),

                      if (widget.tokenReciverType ==
                          TokenReciverType.forgotPasswordConformation)
                        TextFormField(
                          obscureText: true,
                          controller: _conformPasswordController,
                          decoration: const InputDecoration(
                            hintText: "Conform Passowrd",
                          ),
                          validator: (val) {
                            return ValidationService.confromPasswordValidate(
                              _passwordController.text,
                              val,
                            );
                          },
                        ),

                      const Divider(),
                      AuthButton(
                        text: widget.tokenReciverType ==
                                TokenReciverType.forgotPasswordConformation
                            ? "Reset Password "
                            : "Verify Token",
                        buttonStatus:
                            authStateController.status == AuthStatus.loading
                                ? ButtonStatus.busy
                                : ButtonStatus.idle,
                        onPressed: () {
                          if (_fromKey.currentState!.validate()) {
                            if (widget.tokenReciverType ==
                                TokenReciverType.signUpConformation) {
                              authNotifierController.activateAccount(
                                _tokenController.text,
                              );
                            } else if (widget.tokenReciverType ==
                                TokenReciverType.forgotPasswordConformation) {
                              authNotifierController.resetPassword(
                                _tokenController.text,
                                _passwordController.text,
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 50),
                      Text(
                        "Verification Token Has been send to your email address please fonfor",
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                      // AuthTogleButton(
                      //   buttonTitle: "Did token expire ?",
                      //   actionTitle: "resend",
                      //   onTap: () {},
                      // ),
                      const SizedBox(height: 20),
                      if (authStateController.status == AuthStatus.error)
                        AuthErrorBanner(
                          message: authStateController.error!.message,
                          onClose: () => authNotifierController.closeBanner(),
                        )
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

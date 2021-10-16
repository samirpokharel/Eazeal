import 'package:eazeal/controller/controller.dart';
import 'package:eazeal/providers.dart';
import 'package:eazeal/screens/authentication/widgets/widgets.dart';
import 'package:eazeal/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late GlobalKey<FormState> _profileUpdateFormKey;
  late GlobalKey<FormState> _emailUpdateFormKey;
  late GlobalKey<FormState> _passwordUpdateFormKey;

  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _fullAddressController;
  late TextEditingController _emailController;
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswrodController;
  late TextEditingController _conformPassowrdController;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _fullAddressController = TextEditingController();
    _emailController = TextEditingController();
    _currentPasswordController = TextEditingController();
    _newPasswrodController = TextEditingController();
    _conformPassowrdController = TextEditingController();

    _profileUpdateFormKey = GlobalKey<FormState>();
    _emailUpdateFormKey = GlobalKey<FormState>();
    _passwordUpdateFormKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _fullAddressController.dispose();
    _emailController.dispose();
    _currentPasswordController.dispose();
    _newPasswrodController.dispose();
    _conformPassowrdController.dispose();

    _profileUpdateFormKey.currentState?.dispose();
    _emailUpdateFormKey.currentState?.dispose();
    _passwordUpdateFormKey.currentState?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: userControllerProvider,
      onChange: (context, state) {
        if (state is UserSuccess && state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.successMessage!),
            ),
          );
        } else if (state is UserFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.customException.message),
            ),
          );
        }
      },
      child: Consumer(
        builder: (context, watch, child) {
          final userState = watch(userControllerProvider);
          final userController = watch(userControllerProvider.notifier);

          return Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (userState is UserFailed)
                    AuthErrorBanner(
                      message: userState.customException.message,
                      onClose: () => userController.setInitial(),
                    ),
                  _buildUpdateProfileForm(userState, userController),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text(
                    "Update email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildEmailUpdate(userState, userController),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text(
                    "Update Password",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildUpdatePassword(userState, userController),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _buildUpdateProfileForm(UserState userState, UserController userController) {
    return Form(
      key: _profileUpdateFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: _fullNameController,
            decoration: const InputDecoration(hintText: "Full Name"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            validator: (val) => ValidationService.phoneNumberValidation(val),
            controller: _phoneNumberController,
            decoration: const InputDecoration(hintText: "Phone Number"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            validator: (val) =>
                ValidationService.notEmptyValidation(val, "Address"),
            controller: _fullAddressController,
            decoration: const InputDecoration(hintText: "Full Address"),
          ),
          const SizedBox(height: 20),
          AuthButton(
            text: "Update",
            buttonStatus: userState is UserLoading
                ? ButtonStatus.busy
                : ButtonStatus.idle,
            onPressed: () {
              if (_profileUpdateFormKey.currentState!.validate()) {
                userController.updateProfile(
                  _fullNameController.text,
                  _phoneNumberController.text,
                  _fullAddressController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  _buildEmailUpdate(UserState userState, UserController userController) {
    return Form(
      key: _emailUpdateFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            validator: (val) => ValidationService.validateEmail(val),
            decoration: const InputDecoration(hintText: "Email"),
          ),
          const SizedBox(height: 20),
          AuthButton(
            text: "Update",
            buttonStatus: userState is UserLoading
                ? ButtonStatus.busy
                : ButtonStatus.idle,
            onPressed: () {
              if (_emailUpdateFormKey.currentState!.validate()) {
                userController.updateEmail(_emailController.text);
              }
            },
          ),
        ],
      ),
    );
  }

  _buildUpdatePassword(UserState userState, UserController userController) {
    return Form(
      key: _passwordUpdateFormKey,
      child: Column(
        children: [
          TextFormField(
            obscureText: true,
            validator: (val) => ValidationService.validatePassword(val),
            controller: _currentPasswordController,
            decoration: const InputDecoration(hintText: "Current Password"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            validator: (val) => ValidationService.validatePassword(val),
            controller: _newPasswrodController,
            decoration: const InputDecoration(hintText: "New Passsowrd"),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            validator: (val) => ValidationService.confromPasswordValidate(
              val,
              _newPasswrodController.text,
            ),
            controller: _conformPassowrdController,
            decoration: const InputDecoration(hintText: "Conform password"),
          ),
          const SizedBox(height: 20),
          AuthButton(
            text: "Update",
            buttonStatus: userState is UserLoading
                ? ButtonStatus.busy
                : ButtonStatus.idle,
            onPressed: () {
              if (_passwordUpdateFormKey.currentState!.validate()) {
                userController.updatePassowrd(
                  _currentPasswordController.text,
                  _newPasswrodController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/auth.dart' show RegisterPage;

part 'sections/button_register_section.dart';
part 'sections/button_section.dart';
part 'sections/form_section.dart';
part 'sections/sso_section.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/sign_in_page';

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Box Sign In
              _FormSection(key: key),
              // Button Sign In
              _ButtonSection(
                key: key,
                onSignIn: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
              ),
              // Button Sign Up
              _ButtonRegisterSection(key: key),
              // Button SSO
              _SsoSection(key: key),
            ],
          ),
        ),
      ),
    );
  }
}

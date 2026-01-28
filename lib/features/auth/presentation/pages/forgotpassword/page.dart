import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/forgotpassword/blocs/forgot_blocs.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/forgotpassword/blocs/forgot_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/forgotpassword/validator/email_validator.dart';

part 'sections/form_sections.dart';
part 'sections/button_sections.dart';
part 'sections/footer_sections.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const routeName = '/forgot_password_page';

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => ForgotPasswordBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 32),

                // Title + Subtitle grouped
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Enter your email or NIP HSI to reset your password",
                      style: TextStyle(
                        color: AppColors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Form
                _FormSection(formKey: formKey),

                const SizedBox(height: 16),

                // Button
                _ButtonSection(formKey: formKey),

                const Spacer(),

                // Footer
                _FooterSection(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

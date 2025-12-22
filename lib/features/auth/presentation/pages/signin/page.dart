import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/auth.dart' show RegisterPage;
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_blocs.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_state.dart';
import '../forgotpassword/page.dart' show ForgotPasswordPage;

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

    return BlocProvider(
      create: (_) => SignInBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    const SizedBox(height: 24),

                    //FORM
                    _FormSection(formKey: formKey),
                    const SizedBox(height: 16),

                    //BUTTON
                    _ButtonSection(
                      onSignIn: () {
                        context.read<SignInBloc>().add(SignInSubmitted());
                      },
                    ),
                    const SizedBox(height: 16),

                    //BUTTON REGISTER
                    _ButtonRegisterSection(key: UniqueKey()),
                    const SizedBox(height: 16),

                    //REGISTER
                    _SsoSection(key: UniqueKey()),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

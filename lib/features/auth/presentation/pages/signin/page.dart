import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/auth.dart' show RegisterPage;
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_blocs.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_state.dart';

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
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              // ListView otomatis scrollable, nggak perlu SingleChildScrollView + ConstrainedBox
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                const SizedBox(height: 24),
                _FormSection(key: UniqueKey()),
                const SizedBox(height: 16),
                _ButtonSection(
                  key: UniqueKey(),
                  onSignIn: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                ),
                const SizedBox(height: 16),
                _ButtonRegisterSection(key: UniqueKey()),
                const SizedBox(height: 16),
                _SsoSection(key: UniqueKey()),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

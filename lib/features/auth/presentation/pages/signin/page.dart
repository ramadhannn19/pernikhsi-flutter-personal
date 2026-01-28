import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/auth.dart' show RegisterPage;

import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_blocs.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_event.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/signin/blocs/signin_state.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/sso/sso_blocs.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/sso/sso_event.dart';
import 'package:pernikhsi/features/auth/presentation/pages/forgotpassword/page.dart';
import 'package:pernikhsi/features/auth/presentation/pages/register/page.dart';

//Import child page sections
part 'sections/button_register_section.dart';
part 'sections/button_section.dart';
part 'sections/form/pages.dart';
part 'sections/sso_section.dart';

//import child page field
part 'sections/form/fields/email_field.dart';
part 'sections/form/fields/password_field.dart';
part 'sections/form/fields/forgot_password_link.dart';

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
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Center(
                        child: Column(
                          children: [
                            //IMAGE
                            SizedBox(
                              height: 90,
                              child: SvgPicture.asset(
                                'assets/images/svgs/text-logo.svg',
                                height: 45,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // FORM + BUTTON SIGN IN
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _FormSection(formKey: formKey),
                            const SizedBox(height: 16),

                            _ButtonSection(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      //BUTTON REGISTER
                      _ButtonRegisterSection(key: UniqueKey()),
                      const SizedBox(height: 16),

                      //REGISTER SSO
                      BlocProvider(
                        create: (_) => SsoBloc(),
                        child: _SsoSection(),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

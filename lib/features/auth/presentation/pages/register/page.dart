import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pernikhsi/core/core.dart';
import 'package:pernikhsi/features/auth/presentation/blocs/register/blocs/register_bloc.dart';

import '../../blocs/register/blocs/register_event.dart';
import '../../blocs/register/blocs/register_state.dart';

// daftar semua file anak di sini
part 'sections/button_section.dart';
part 'sections/footer_section.dart';
part 'sections/form/form_section.dart';

part 'sections/form/fields/name_field.dart';
part 'sections/form/fields/gender_field.dart';
part 'sections/form/fields/nip_field.dart';
part 'sections/form/fields/email_field.dart';
part 'sections/form/fields/phone_field.dart';
part 'sections/form/fields/password_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Form Register
                  _FormSection(key: null, formKey: formKey),
                  Dimens.dp16.height,

                  //Button Register
                  RegisterButton(key: null, formKey: formKey),
                  Dimens.dp16.height,

                  //Footer Register
                  _FooterSection(key: null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

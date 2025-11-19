part of '../../page.dart';

class _FormSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const _FormSection({super.key, required this.formKey});

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Form(
        key: widget.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name
            _NameField(key: Key("name_field")),
            Dimens.dp16.height,

            // Gender
            _GenderField(key: Key("gender_field")),
            Dimens.dp16.height,

            //NIP HSI
            _NipField(key: Key("nip_field")),
            Dimens.dp16.height,

            //Email
            _EmailField(key: Key("email_field")),
            Dimens.dp16.height,

            //Phone
            _PhoneField(key: Key("phone_field")),
            Dimens.dp16.height,

            //Password
            _PasswordField(key: Key("password_field")),
            Dimens.dp16.height,
          ],
        ),
      ),
    );
  }
}

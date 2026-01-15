part of '../page.dart';

class _FormSection extends StatelessWidget {
  const _FormSection({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.grey[900]!),
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email / NIP HSI',
              style: TextStyle(color: context.theme.colorScheme.primary),
            ),
            const SizedBox(height: 8),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Input your email',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                border: const OutlineInputBorder(),
              ),

              //Connect UI -> Validator
              validator: ForgotPasswordValidator.validate,

              //Send to bloc
              onChanged: (value) {
                context.read<ForgotPasswordBloc>().add(
                  ForgotPasswordEmailChanged(value),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

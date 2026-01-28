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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.10 * 255).round()),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email / NIP HSI',
              style: TextStyle(
                color: context.theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              validator: ForgotPasswordValidator.validate,
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

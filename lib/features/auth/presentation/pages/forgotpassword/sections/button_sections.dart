part of '../page.dart';

class _ButtonSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _ButtonSection({required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      height: 48,

      child: FilledButton(
        //Check Validator
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<ForgotPasswordBloc>().add(ForgotPasswordSubmitted());
          }
        },

        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(color: context.theme.colorScheme.primary),
          ),
          backgroundColor: const WidgetStatePropertyAll(AppColors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          ),
        ),

        child: Text(
          "Send Reset Link",
          style: TextStyle(
            color: context.theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

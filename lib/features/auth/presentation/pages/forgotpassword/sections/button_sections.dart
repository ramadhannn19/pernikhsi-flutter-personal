part of '../page.dart';

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            // Trigger ForgotPasswordBloc submit event
            context.read<ForgotPasswordBloc>().add(ForgotPasswordSubmitted());
          }
        },
        child: const Text('Send Reset Link'),
      ),
    );
  }
}

part of '../page.dart';

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({this.onSubmit});

  final VoidCallback? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      height: 48,

      child: FilledButton(
        onPressed: onSubmit,
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

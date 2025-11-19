part of '../page.dart';

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({super.key, this.onSignIn});

  final bool isLoading = false;
  final VoidCallback? onSignIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      height: 48,
      child: FilledButton(
        onPressed: onSignIn,
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(
              strokeAlign: 1,
              color: context.theme.colorScheme.primary,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          ),
        ),
        child: Text(
          "Sign In",
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

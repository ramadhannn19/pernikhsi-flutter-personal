part of '../page.dart';

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(fontSize: 16, color: AppColors.black),
        ),

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

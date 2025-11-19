part of '../page.dart';

class _ButtonRegisterSection extends StatelessWidget {
  const _ButtonRegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New member? ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context.theme.colorScheme.primary,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RegisterPage.routeName);
              },
              child: Text(
                "Create an account",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: context.theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

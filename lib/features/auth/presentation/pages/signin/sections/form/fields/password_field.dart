part of '../../../page.dart';

class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(color: context.theme.colorScheme.primary),
        ),
        const SizedBox(height: 8),

        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return TextFormField(
              obscureText: _obscureText,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                context.read<SignInBloc>().add(SignInPasswordChanged(value));
              },
              decoration: InputDecoration(
                hintText: "Type your password",
                hintStyle: context.theme.textTheme.bodyMedium!.copyWith(
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
                errorText: state.passwordError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: context.theme.colorScheme.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              style: TextStyle(color: context.theme.colorScheme.primary),
            );
          },
        ),
      ],
    );
  }
}

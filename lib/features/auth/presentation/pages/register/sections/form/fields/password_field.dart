part of '../../../page.dart';

class _PasswordField extends StatefulWidget {
  const _PasswordField({super.key});

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
        const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black),
        ),
        const SizedBox(height: 8),

        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: "Input Your Password",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                errorText: state.passwordError,
              ),
              onChanged: (value) {
                context.read<RegisterBloc>().add(PasswordChanged(value));
              },
            );
          },
        ),
      ],
    );
  }
}

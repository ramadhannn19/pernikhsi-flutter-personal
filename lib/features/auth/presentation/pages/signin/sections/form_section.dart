part of '../page.dart';

class _FormSection extends StatefulWidget {
  const _FormSection({super.key});

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: context.theme.colorScheme.primary),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              RegularInput(
                label: 'Email / No. HP / NIP HSI',
                hintText: "Type here",
                validator: (validator) {
                  if (validator!.isEmpty) {
                    return 'Email / No. HP / NIP HSI is required';
                  }
                  return null;
                },
              ),
              RegularInput(
                label: 'Password',
                hintText: "Type here",
                obscureText: _obscureText,
                suffix: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.remove_red_eye : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  color: context.theme.colorScheme.primary,
                ),
                validator: (validator) {
                  if (validator!.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: context.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

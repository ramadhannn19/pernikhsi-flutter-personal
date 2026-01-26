part of '../../page.dart';

class _FormSection extends StatefulWidget {
  const _FormSection({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            _EmailField(),
            SizedBox(height: 16),
            _PasswordField(),
            SizedBox(height: 10),
            _ForgotPassword(),
          ],
        ),
      ),
    );
  }
}

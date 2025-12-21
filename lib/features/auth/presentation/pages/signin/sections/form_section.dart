part of '../page.dart';

class _FormSection extends StatefulWidget {
  const _FormSection({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppColors.grey[900]!),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //EMAIL
                      Text(
                        "Email / NIP HSI",
                        style: TextStyle(
                          color: context.theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),

                      BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) {
                          return TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => context
                                .read<SignInBloc>()
                                .add(EmailChanged(value)),
                            decoration: InputDecoration(
                              labelText: "Input Your Email",
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: AppColors.grey,
                              ),
                              border: const OutlineInputBorder(),
                              errorText: state.emailError,
                            ),
                          );
                        },
                      ),

                      //PASSWORD
                      RegularInput(
                        label: 'Password',
                        hintText: "Type here",
                        obscureText: _obscureText,
                        onChange: (value) {
                          context.read<SignInBloc>().add(
                            PasswordChanged(value),
                          );
                        },
                        errorText: state.passwordError,
                        suffix: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          color: context.theme.colorScheme.primary,
                        ),
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
            ),
          ),
        );
      },
    );
  }
}

part of '../../../page.dart';

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email / NIP HSI",
          style: TextStyle(color: context.theme.colorScheme.primary),
        ),
        const SizedBox(height: 8),

        BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                context.read<SignInBloc>().add(SignInEmailChanged(value));
              },
              decoration: InputDecoration(
                hintText: "Input Your Email",
                hintStyle: context.theme.textTheme.bodyMedium!.copyWith(
                  color: context.theme.colorScheme.primary.withValues(
                    alpha: 0.5,
                  ),
                ),
                errorText: state.emailError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.primary,
                  ),
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

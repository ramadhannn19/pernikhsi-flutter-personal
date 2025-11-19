part of '../../../page.dart';

class _EmailField extends StatelessWidget {
  const _EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black),
        ),
        const SizedBox(height: 8),

        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) =>
                  context.read<RegisterBloc>().add(EmailChanged(value)),
              decoration: InputDecoration(
                labelText: "Input Your Email",
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                border: const OutlineInputBorder(),
                errorText: state.emailError, // tampil error kalau ada
              ),
            );
          },
        ),
      ],
    );
  }
}

part of '../../../page.dart';

class _NameField extends StatelessWidget {
  const _NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  context.read<RegisterBloc>().add(NameChanged(value)),
              decoration: InputDecoration(
                labelText: "Input Your Name",
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey,
                ),
                errorText: state.nameError,
                border: OutlineInputBorder(),
              ),
            );
          },
        ),
        Dimens.dp16.height,
      ],
    );
  }
}

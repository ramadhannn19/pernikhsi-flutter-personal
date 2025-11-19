part of '../../../page.dart';

class _NipField extends StatelessWidget {
  const _NipField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "NIP HSI",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black),
        ),
        const SizedBox(height: 8),

        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return TextField(
              onChanged: (value) =>
                  context.read<RegisterBloc>().add(NIPChanged(value)),
              decoration: InputDecoration(
                labelText: "NIP Student",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                border: OutlineInputBorder(),
                errorText: state.nipError,
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
            );
          },
        ),
      ],
    );
  }
}

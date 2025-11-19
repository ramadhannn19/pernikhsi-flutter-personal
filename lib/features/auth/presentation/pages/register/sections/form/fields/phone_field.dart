part of '../../../page.dart';

class _PhoneField extends StatelessWidget {
  const _PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone",
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black),
        ),
        const SizedBox(height: 8),

        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                context.read<RegisterBloc>().add(NumberChanged(value));
              },
              decoration: InputDecoration(
                labelText: "0852XXXXXXXX",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
                border: OutlineInputBorder(),
                errorText: state.numberError,
              ),
            );
          },
        ),
      ],
    );
  }
}

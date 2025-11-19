part of '../../../page.dart';

class _GenderField extends StatelessWidget {
  const _GenderField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gender",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return DropdownButtonFormField<String>(
              hint: const Text("Select Gender"),

              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.grey[90],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              items: const [
                DropdownMenuItem(value: "Male", child: Text("Male")),
                DropdownMenuItem(value: "Female", child: Text("Female")),
              ],
              onChanged: (value) {
                context.read<RegisterBloc>().add(GenderChanged(value!));
              },
            );
          },
        ),
      ],
    );
  }
}

part of '../page.dart';

class _ButtonSection extends StatelessWidget {
  const _ButtonSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        final isLoading = state.status == SignInStatus.loading;

        return SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: isLoading
                ? null
                : () {
                    context.read<SignInBloc>().add(SignInSubmitted());
                  },
            style: ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(
                  strokeAlign: 1,
                  color: context.theme.colorScheme.primary,
                ),
              ),
              backgroundColor: const WidgetStatePropertyAll(AppColors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              ),
            ),

            //Conditional Rendering UI
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    "Sign In",
                    style: TextStyle(
                      color: context.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        );
      },
    );
  }
}

part of '../page.dart';

class _SsoSection extends StatelessWidget {
  const _SsoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Text(
          "- Or continue with -",
          style: TextStyle(color: context.theme.colorScheme.primary),
        ),
        SizedBox(height: 16),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff394675), width: 2),
              ),
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                MainAssets.logoGoogleSvg,
                width: Dimens.dp300,
              ),
            ),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff394675), width: 2),
              ),
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                MainAssets.logoAppleSvg,
                width: Dimens.dp300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

part of '../page.dart';

class _SsoSection extends StatelessWidget {
  const _SsoSection();

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
            //GOOGLE
            InkWell(
              onTap: () {
                context.read<SsoBloc>().add(GoogleSignInPressed());
                debugPrint('Google SSO Clicked');
              },
              borderRadius: BorderRadius.circular(24),
              child: Container(
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
            ),

            //APPLE
            InkWell(
              onTap: () {
                context.read<SsoBloc>().add(AppleSignInPressed());
                debugPrint('Apple SSO Clicked');
              },
              borderRadius: BorderRadius.circular(24),
              child: Container(
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
            ),

            //FACEBOOK
            InkWell(
              onTap: () {
                context.read<SsoBloc>().add(FacebookSignInPressed());
                debugPrint('Facebook SSO Clicked');
              },
              borderRadius: BorderRadius.circular(24),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xff394675), width: 2),
                ),
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  MainAssets.logoFacebookSvg,
                  width: Dimens.dp300,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

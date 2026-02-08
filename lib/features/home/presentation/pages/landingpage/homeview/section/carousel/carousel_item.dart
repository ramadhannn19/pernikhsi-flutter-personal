part of '../../page.dart';

class _CarouselItem extends StatelessWidget {
  const _CarouselItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 133,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('assets/images/png/img-1.png', fit: BoxFit.fill),
      ),
    );
  }
}

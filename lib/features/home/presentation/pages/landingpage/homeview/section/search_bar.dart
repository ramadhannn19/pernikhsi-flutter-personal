part of '../page.dart';

class _SearchBar extends StatelessWidget {
  const _SearchBar();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24), // pill
          child: Container(
            height: 48,
            color: AppColors.white,
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Find your favorites here',
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

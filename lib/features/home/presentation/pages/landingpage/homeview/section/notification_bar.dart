part of '../page.dart';

class _NotificationBar extends StatelessWidget {
  const _NotificationBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: AppColors.blue[700]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // close-dismiss
          IconButton(
            onPressed: () {
              // dismiss notification bar
            },
            icon: const Icon(Icons.close, size: 27, color: AppColors.white),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 16,
          ),

          const SizedBox(width: 8),

          // Main text
          Expanded(
            child: Text(
              'Disc 5% for every bulk purchase!',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 8),

          GestureDetector(
            onTap: () {
              // action contact us
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16), // pill shape
              ),
              child: Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue[700],
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

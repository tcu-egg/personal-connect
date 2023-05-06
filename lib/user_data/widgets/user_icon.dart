import 'package:flutter/material.dart';

class UserIconWidget extends StatelessWidget {
  const UserIconWidget({super.key, this.iconUrl});

  final String? iconUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.network(
        iconUrl ?? 'https://picsum.photos/seed/495/600',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
            const Center(child: Text('エラーが発生しました')),
      ),
    );
  }
}

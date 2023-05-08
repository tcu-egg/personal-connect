import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_connect/user_data/widgets/user_icon.dart';

class StatusCardWidget extends HookWidget {
  const StatusCardWidget({
    super.key,
    required this.displayName,
    this.iconUrl,
    required this.statusMessage,
  });

  final String displayName;
  final String? iconUrl;
  final String statusMessage;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Column(
          children: [
            UserIconWidget(iconUrl: iconUrl),
            Text(
              displayName,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              statusMessage,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

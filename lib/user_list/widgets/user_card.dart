import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_connect/user_data/widgets/user_icon.dart';

import '../../user_data/entities/user_data.dart';

class UserCardWidget extends HookWidget {
  const UserCardWidget({
    super.key,
    required this.userData,
    this.button,
  });

  final UserData userData;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Container(
        padding: const EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  UserIconWidget(iconUrl: userData.iconUrl),
                  const SizedBox(width: 16),
                  Text(
                    userData.displayName,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: button != null,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

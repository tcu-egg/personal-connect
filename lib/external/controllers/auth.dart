import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../user_info/entities/user_data.dart';
import '../../user_info/repositories/user_data.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authControllerProvider = Provider<AuthController>(AuthController.new);

class AuthController {
  AuthController(this.ref);
  final ProviderRef<AuthController> ref;

  Future<User?> signInWithMicrosoft(BuildContext context) async {
    try {
      final credential = await ref
          .watch(firebaseAuthProvider)
          .signInWithPopup(MicrosoftAuthProvider());

      // FIXME: エラーハンドリング
      if (credential.user == null || credential.user!.email == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('ユーザ情報が取得できませんでした'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }

      // 認証ガード
      // @tcu.ac.jp以外のユーザを弾く
      if (!credential.user!.email!.endsWith('@tcu.ac.jp')) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('あなたのアカウント(${credential.user!.email!})では本サービスを利用できません'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
        await signOut();
      }

      if (credential.additionalUserInfo != null &&
          credential.additionalUserInfo!.isNewUser) {
        final userInfoRepository =
            ref.watch(userInfoRepositoryProvider(credential.user!.uid));
        await userInfoRepository.save(
          entity: UserData.withDefaults(
            displayName: credential.user!.displayName ?? 'ユーザー',
          ),
        );
      }

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
    return null;
  }

  Future<void> signOut() async {
    await ref.watch(firebaseAuthProvider).signOut();
  }
}

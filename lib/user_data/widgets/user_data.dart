import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_connect/user_data/widgets/one_text_form.dart';
import 'package:personal_connect/user_data/widgets/user_icon.dart';

import '../entities/user_data.dart';

class UserDataWidget extends HookWidget {
  const UserDataWidget({
    super.key,
    this.initialUserInfo,
    this.email,
    this.canEdit = false,
    this.onSave,
  });

  final UserData? initialUserInfo;
  final String? email;
  final bool? canEdit;
  final void Function(UserData entity)? onSave;

  @override
  Widget build(BuildContext context) {
    final displayNameController =
        useTextEditingController(text: initialUserInfo?.displayName);
    final emailController = useTextEditingController(text: email);
    final state = useState(initialUserInfo);

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: UserIconWidget(iconUrl: initialUserInfo?.iconUrl),
            ),
            SizedBox(
              width: 460,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: email != null,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        16,
                        16,
                        16,
                        0,
                      ),
                      child: OneTextFormWidget(
                        controller: emailController,
                        labelText: 'メールアドレス',
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: OneTextFormWidget(
                      controller: displayNameController,
                      canEdit: canEdit,
                      labelText: '表示名',
                      prefixIcon: const Icon(
                        Icons.person_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            canEdit == true
                ? Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: onSave != null
                            ? () {
                                onSave!(
                                  state.value!.copyWith(
                                    displayName: displayNameController.text,
                                  ),
                                );
                              }
                            : null,
                        child: const Text('変更を保存'),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

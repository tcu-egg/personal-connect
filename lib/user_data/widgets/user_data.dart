import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:personal_connect/user_data/widgets/one_text_form.dart';
import 'package:personal_connect/user_data/widgets/user_icon.dart';

import '../entities/gender.dart';
import '../entities/user_data.dart';

class UserDataWidget extends HookWidget {
  const UserDataWidget({
    super.key,
    required this.initialUserInfo,
    this.email,
    this.canEdit = false,
    this.onSave,
  });

  final UserData initialUserInfo;
  final String? email;
  final bool? canEdit;
  final void Function(UserData entity)? onSave;

  @override
  Widget build(BuildContext context) {
    final displayNameController =
        useTextEditingController(text: initialUserInfo.displayName);
    final emailController = useTextEditingController(text: email);
    final snsUrlController =
        useTextEditingController(text: initialUserInfo.snsUrl);
    final statusMessageController =
        useTextEditingController(text: initialUserInfo.statusMessage);
    final univInfoController =
        useTextEditingController(text: initialUserInfo.univInfo);
    final state = useState(initialUserInfo);

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            UserIconWidget(iconUrl: initialUserInfo.iconUrl),
            SizedBox(
              width: 460,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: email != null,
                    child: OneTextFormWidget(
                      controller: emailController,
                      labelText: 'メールアドレス',
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OneTextFormWidget(
                    controller: displayNameController,
                    canEdit: canEdit,
                    labelText: '表示名',
                    prefixIcon: const Icon(
                      Icons.person_rounded,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OneTextFormWidget(
                    controller: univInfoController,
                    canEdit: canEdit,
                    labelText: '大学情報',
                    prefixIcon: const Icon(
                      Icons.school_rounded,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OneTextFormWidget(
                    controller: statusMessageController,
                    canEdit: canEdit,
                    labelText: 'つぶやき',
                    prefixIcon: const Icon(
                      Icons.mode_comment_rounded,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OneTextFormWidget(
                    controller: snsUrlController,
                    canEdit: canEdit,
                    labelText: 'SNS',
                    prefixIcon: const Icon(
                      Icons.link_rounded,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: state.value.gender,
                    decoration: InputDecoration(
                      labelText: '性別',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.background,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.background,
                      prefixIcon: const Icon(Icons.wc_rounded),
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                    items: Gender.values
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (item) {
                      if (item != null) {
                        state.value = state.value.copyWith(gender: item);
                      }
                    },
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
                                  state.value.copyWith(
                                    displayName: displayNameController.text,
                                    snsUrl: snsUrlController.text,
                                    univInfo: univInfoController.text,
                                    statusMessage: statusMessageController.text,
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

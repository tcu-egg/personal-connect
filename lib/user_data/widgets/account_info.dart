import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../entities/user_data.dart';

class AccountInfo extends HookWidget {
  const AccountInfo({
    super.key,
    this.initialUserInfo,
    this.email = '',
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
    final dirty = useState(false);
    void checkChanged() {
      dirty.value = displayNameController.text != initialUserInfo?.displayName;
    }

    final state = useState(initialUserInfo);

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  state.value?.iconUrl ?? 'https://picsum.photos/seed/495/600',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
            ),
            SizedBox(
              width: 460,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      initialValue: email,
                      decoration: InputDecoration(
                        labelText: 'メールアドレス',
                        // labelStyle: Theme.of(context).subtitle2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.background,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        prefixIcon: const Icon(
                          Icons.email,
                          // color: Theme.of(context).secondaryText,
                        ),
                      ),
                      enabled: false,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                    child: TextFormField(
                      controller: displayNameController,
                      enabled: canEdit,
                      onChanged: (_) => checkChanged(),
                      decoration: InputDecoration(
                        labelText: '表示名',
                        // labelStyle: Theme.of(context).subtitle2,
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
                        prefixIcon: const Icon(
                          Icons.person_rounded,
                          // color: Theme.of(context).secondaryText,
                        ),
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
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
                        onPressed: dirty.value && onSave != null
                            ? () {
                                onSave!(
                                  state.value!.copyWith(
                                    displayName: displayNameController.text,
                                  ),
                                );
                                dirty.value = false;
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
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AccountInfo extends HookWidget {
  const AccountInfo({
    super.key,
    this.iconUrl = '',
    this.email = '',
    this.displayName = '',
    this.canEdit = false,
  });

  final String? iconUrl;
  final String? email;
  final String? displayName;
  final bool? canEdit;

  @override
  Widget build(BuildContext context) {
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
                  iconUrl ?? '',
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
                      // controller: _model.textController2 ??=
                      //     TextEditingController(
                      //   text: editProfileUsersRecord!.displayName,
                      // ),
                      initialValue: displayName,
                      enabled: canEdit,
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
                      // validator:
                      //     _model.textController2Validator.asValidator(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

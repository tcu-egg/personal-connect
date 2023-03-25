import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/components/layout.dart';
import 'package:personal_connect/components/navigation_bar.dart';

import '../controllers/auth.dart';

class MyAccountPage extends ConsumerWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: const CommonNavigationBar(),
      body: SafeArea(
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
                    'https://picsum.photos/seed/495/600',
                    fit: BoxFit.cover,
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
                        initialValue: firebaseAuth.currentUser?.email ?? '',
                        decoration: InputDecoration(
                          labelText: 'Email',
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
                        decoration: InputDecoration(
                          labelText: 'user name',
                          // labelStyle: Theme.of(context).subtitle2,
                          hintText: 'Please enter your full name...',
                          // hintStyle: Theme.of(context).subtitle2,
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
      ),
    );
  }
}

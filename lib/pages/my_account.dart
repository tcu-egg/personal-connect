import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:personal_connect/components/layout.dart';

import '../controllers/auth.dart';

class MyAccountPage extends ConsumerWidget {
  const MyAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: commonAppBar(),
      bottomNavigationBar: navigationBar(),
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
                width: 461.9,
                height: 236.8,
                // decoration: BoxDecoration(
                //   color: Theme.of(context).secondaryBackground,
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
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
                        //     _model.textController1Validator.asValidator(context),
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
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: TextFormField(
                        // controller: _model.textController3,
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
                        //     _model.textController3Validator.asValidator(context),
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

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('home'),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6DB1E7),
        automaticallyImplyLeading: false,
        title: const Text(
          'PersonalConnect',
        ),
        actions: const [],
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('logo'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('アカウント登録'),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                            0,
                            2,
                            0,
                            20,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('ログイン'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

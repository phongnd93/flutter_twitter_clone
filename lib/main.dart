import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/common/common.dart';
import 'package:flutter_twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:flutter_twitter_clone/features/auth/view/login.dart';
import 'package:flutter_twitter_clone/features/auth/view/sign_up.dart';
import 'package:flutter_twitter_clone/features/home/view/home_view.dart';

import 'theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return const HomeView();
              } else {
                return const LoginView();
              }
            },
            error: (error, stackTrace) => ErrorPage(message: error.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}

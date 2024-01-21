import 'package:ceddit/features/auth/controller/auth_controller.dart';
import 'package:ceddit/core/common/loader.dart';
import 'package:ceddit/core/common/sign_in_button.dart';
import 'package:ceddit/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Dive into anything',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset(
                  Constants.loginEmotePath,
                  height: 400,
                ),
                const SizedBox(height: 20),
                const SignInButton(),
              ],
            ),
    );
  }
}

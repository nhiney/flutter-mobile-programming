// This file now delegates to the new LoginScreen.
// Kept for backward compatibility with menu_screen.dart import.
export 'login_screen.dart' show LoginScreen;

import 'package:flutter/material.dart';
import 'login_screen.dart';

/// Wrapper that redirects to the redesigned LoginScreen.
/// Maintains the same class name so existing references continue to work.
class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

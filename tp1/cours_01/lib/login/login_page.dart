import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        titleSpacing: 24,
        title: const Text(
          'Log in or sign up',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const EmailField(),
            const SizedBox(height: 16),

            ContinueButton(
              onPressed: () {
                debugPrint('Continue pressed');
              },
            ),

            const SizedBox(height: 20),
            const OrSeparator(),
            const SizedBox(height: 20),

            SocialLoginButton(
              label: 'Continue with Apple',
              iconPath: 'assets/apple_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            SocialLoginButton(
              label: 'Continue with Google',
              iconPath: 'assets/google_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            SocialLoginButton(
              label: 'Continue with Facebook',
              iconPath: 'assets/facebook_logo.svg',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Email Address',
        hintStyle: TextStyle(
          color: Color(0xFF9CA3AF),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Color(0xFF111827),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color(0xFFCBD5E1),
            width: 2,
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ContinueButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF238A9A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: const Text('Continue'),
      ),
    );
  }
}

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFE5E7EB),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Or',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFE5E7EB),
          ),
        ),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFE5E7EB)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF111827),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

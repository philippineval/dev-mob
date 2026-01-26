import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cours_01/res/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        titleSpacing: 16,
        title: const Text(
          'Log in or sign up',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmailField(
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),

            const SizedBox(height: 24),

            ContinueButton(
              onPressed: _email.isNotEmpty
                  ? () {
                      debugPrint('Continue pressed with email: $_email');
                    }
                  : null,
            ),

            const SizedBox(height: 40),
            const OrSeparator(),
            const SizedBox(height: 40),

            ContinueWithButton(
              label: 'Apple',
              iconPath: 'assets/apple_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            ContinueWithButton(
              label: 'Google',
              iconPath: 'assets/google_logo.svg',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            ContinueWithButton(
              label: 'Facebook',
              iconPath: 'assets/facebook_logo.svg',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------
// Widget : Champ email
// --------------------
class EmailField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const EmailField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined, color: AppColors.textPrimary),
        hintText: 'Email Address',
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputFieldInactiveBackground,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.inputFieldActiveBackground,
            width: 2,
          ),
        ),
      ),
    );
  }
}

// ------------------------
// Widget : Bouton Continue
// ------------------------
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
          foregroundColor: AppColors.buttonPrimaryText,
          backgroundColor: AppColors.buttonPrimaryBackground,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: const Text('Continue'),
      ),
    );
  }
}

// ---------------------
// Widget : Séparateur Or
// ---------------------
class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider()),
        SizedBox(width: 10),
        Text(
          'Or',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        Expanded(child: Divider()),
      ],
    );
  }
}

// ----------------------------------
// Widget : Bouton "Continue with ..."
// ----------------------------------
class ContinueWithButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onPressed;

  const ContinueWithButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.buttonSecondaryText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(color: AppColors.buttonSecondaryBackground),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 22, height: 22),
            Expanded(
              child: Text(
                'Continue with $label',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 22),
          ],
        ),
      ),
    );
  }
}

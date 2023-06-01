import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/login/widget/text_or_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;

  late bool newUser;

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _submitLogin() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selamat ${_emailController.text} berhasil login'),
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
          context, '/bottom-nav', (route) => false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // Form Login
          //========================================================
          // Input Email
          //========================================================
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailController,
            validator: (email) {
              if (email != null && !EmailValidator.validate(email)) {
                return 'Enter a valid email';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: 'Email',
              hintStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              hintText: 'Input Email',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 25.0),
          // Input Password
          //========================================================
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: _obscureText,
            controller: _passwordController,
            validator: (value) {
              if (value != null && value.length < 5) {
                return 'Enter min. 5 characters';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: 'Password',
              hintStyle: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: _togglePasswordVisibility,
              ),
              hintText: 'Input Password',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20.0),

          // CheckBox remember me
          //========================================================
          Row(
            children: <Widget>[
              SizedBox(
                width: 24,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                'Remember me',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25.0),

          // Button Login
          //========================================================
          FractionallySizedBox(
            widthFactor: 1.0,
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF005DB9)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100), // Bentuk border
                    ),
                  ),
                ),
                onPressed: _submitLogin,
                child: Text(
                  'Login',
                  style: GoogleFonts.roboto(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // Style untuk text OR
          //========================================================
          const TextOr(),

          // Button Login
          //========================================================
          const SizedBox(height: 10.0),
          FractionallySizedBox(
            widthFactor: 1.0,
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF292A2D)),
                      borderRadius: BorderRadius.circular(100), // Bentuk border
                    ),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/img/google.svg'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Sign In With Google',
                      style: GoogleFonts.roboto(color: const Color(0xFF292A2D)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

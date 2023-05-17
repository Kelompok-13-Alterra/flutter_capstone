import 'package:flutter/material.dart';
import 'package:flutter_capstone/widget/login-widget/text-or.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({super.key});

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isChecked = false;

  late bool newUser;

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _submitSignup() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selamat ${_nameController.text} berhasil login'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            //form name

            TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value != null && value.length < 5) {
                  return 'Enter min. 4 characters';
                } else {
                  return null; //form is valid
                }
              },
              decoration: InputDecoration(
                labelText: 'Nama',
                hintStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                hintText: 'Input Full Name',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            // Form Login
            //========================================================
            // Input Email
            //========================================================
            TextFormField(
              controller: _emailController,
              validator: (email) {
                // 5 install package email_validator
                if (email != null && !EmailValidator.validate(email)) {
                  return 'Enter a valid email';
                } else {
                  return null; //form is valid
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
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25.0),
            // Input Password
            //========================================================
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value != null && value.length < 5) {
                  return 'Enter min. 5 characters';
                } else {
                  return null; //form is valid
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
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),

            //confirmpassword
            TextFormField(
              controller: _confirmPasswordController,
              validator: (value) {
                if (value != null && value.length < 5) {
                  return 'Enter min. 5 characters';
                } else {
                  return null; //form is valid
                }
              },
              decoration: InputDecoration(
                labelText: 'Confirm Password',
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
                hintText: 'Input Password Again',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
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
                  'I Agree with Terms and Condition',
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
                        MaterialStateProperty.all(Color(0xFF005DB9)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(100), // Bentuk border
                      ),
                    ),
                  ),
                  onPressed: _submitSignup,
                  child: Text(
                    'Sign Up',
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
                        side: BorderSide(width: 1, color: Color(0xFF292A2D)),
                        borderRadius:
                            BorderRadius.circular(100), // Bentuk border
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
                        'Continue With Google',
                        style: GoogleFonts.roboto(color: Color(0xFF292A2D)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

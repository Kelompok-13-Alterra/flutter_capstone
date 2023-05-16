// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late bool newUser;

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
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header ( Logo, Judul Deskripsi )
                  //========================================================
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset('assets/img/logo-sign.svg'),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    'Sign In',
                    style: GoogleFonts.roboto(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Silahkan masuk dengan akunmu yang sudah terdaftar di Office Buddy',
                    style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        color: Color(0xFF98A2B3),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          // Form Login
                          //========================================================
                          // Input Email
                          //========================================================
                          TextFormField(
                            controller: _emailController,
                            validator: (email) {
                              // 5 install package email_validator
                              if (email != null &&
                                  !EmailValidator.validate(email)) {
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                              hintText: 'Input Password',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ),
                              SizedBox(
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
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF005DB9)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          100), // Bentuk border
                                    ),
                                  ),
                                ),
                                onPressed: () {},
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
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: double
                                      .infinity, // Atur lebar garis sesuai kebutuhan
                                  child: const Divider(
                                    color: Color(0xFF77777A),
                                    thickness:
                                        1.0, // Atur ketebalan garis sesuai kebutuhan
                                  ),
                                ),
                              ),
                              Text(
                                "OR",
                                style: GoogleFonts.roboto(
                                  color: Color(0xFF77777A),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: double
                                      .infinity, // Atur lebar garis sesuai kebutuhan
                                  child: const Divider(
                                    color: Color(0xFF77777A),
                                    thickness:
                                        1.0, // Atur ketebalan garis sesuai kebutuhan
                                  ),
                                ),
                              ),
                            ],
                          ),

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
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1, color: Color(0xFF292A2D)),
                                      borderRadius: BorderRadius.circular(
                                          100), // Bentuk border
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
                                      style: GoogleFonts.roboto(
                                          color: Color(0xFF292A2D)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              RichText(
                text: TextSpan(
                  text: 'You don\'t have an account? ',
                  style: GoogleFonts.roboto(
                    color: Color(0xFF77777A),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Register here',
                      style: GoogleFonts.roboto(
                          color: Color(0xFF0074E5),
                          fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

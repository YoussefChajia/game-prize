import 'dart:html';

import 'package:axie_scholarship/Screens/signInEmail.dart';
import 'package:axie_scholarship/Services/Auth.dart';
import 'package:axie_scholarship/Widgets/SignInButton.dart';
import 'package:axie_scholarship/Widgets/SignTextField.dart';
import 'package:axie_scholarship/Widgets/circleButton.dart';
import 'package:axie_scholarship/enums/pageType.dart';
import 'package:axie_scholarship/enums/textFieldType.dart';
import 'package:axie_scholarship/models/pageSwitcher.dart';
import 'package:axie_scholarship/models/screenSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpEmailPage extends StatefulWidget {
  const SignUpEmailPage({Key? key}) : super(key: key);

  @override
  _SignUpEmailPageState createState() => _SignUpEmailPageState();
}

class _SignUpEmailPageState extends State<SignUpEmailPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(),
      usernameController = TextEditingController(),
      passwordController = TextEditingController(),
      secondPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            color: Color(0xff212121),
          ),
        ),
        Positioned(
          child: SvgPicture.asset(
            "assets/Vectors/shapeAndCircle.svg",
            width: context.read<ScreenSize>().width * 1.275,
            height: context.read<ScreenSize>().width * 1.176,
          ),
          right: -context.read<ScreenSize>().width * .36,
          top: context.read<ScreenSize>().width * -0.3613,
        ),
        Positioned(
          top: context.read<ScreenSize>().width * .085,
          left: context.read<ScreenSize>().width * .10,
          child: CircleButton(
            icon: Icons.arrow_back,
            iconColor: Color(0xff212121),
            onPressed: () async {
              context
                  .read<PageSwitcher>()
                  .changePage(newPage: PageType.LoginPage);
            },
            fillColor: Colors.white,
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: context.read<ScreenSize>().width * .8147),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignTextField(
                  fieldType: TextFieldType.Username,
                  textController: usernameController,
                ),
                SizedBox(
                  height: context.read<ScreenSize>().height * .02,
                ),
                SignTextField(
                  fieldType: TextFieldType.Email,
                  textController: emailController,
                ),
                SizedBox(
                  height: context.read<ScreenSize>().height * .02,
                ),
                SignTextField(
                    fieldType: TextFieldType.Password,
                    textController: passwordController),
                SizedBox(
                  height: context.read<ScreenSize>().height * .02,
                ),
                SignTextField(
                  fieldType: TextFieldType.SecondPassword,
                  textController: secondPasswordController,
                ),
                SizedBox(
                  height: context.read<ScreenSize>().height * .05,
                ),
                Container(
                  width: context.read<ScreenSize>().width * .695,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SignInButton(
                        width: context.read<ScreenSize>().width * .45,
                        buttonText: "Sign Up",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<AuthService>()
                                .signUpWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);
                          }
                        },
                        textColor: Colors.white,
                        backgroundColor: Color(0xFF536DFE),
                      ),
                      //!sign Up with google button
                      Container(
                        width: context.read<ScreenSize>().width * .16,
                        child: MaterialButton(
                          height: (context.read<ScreenSize>().height) * .05,
                          minWidth: (context.read<ScreenSize>().width) * .15,
                          color: Color(0xFF536DFE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                            size: context.read<ScreenSize>().width * .04,
                          ),
                          onPressed: () async {
                            await context
                                .read<AuthService>()
                                .signInWithGoogle();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.read<ScreenSize>().height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: context.read<ScreenSize>().width * .05,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.montserrat(
                          color: Color(0xff2D7DD2),
                          fontSize: context.read<ScreenSize>().width * .05,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        //TODO : adding the switch to the login page
                        context
                            .read<PageSwitcher>()
                            .changePage(newPage: PageType.SignInEmailPage);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

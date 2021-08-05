import 'package:axie_scholarship/Services/Auth.dart';
import 'package:axie_scholarship/Widgets/SignInButton.dart';
import 'package:axie_scholarship/Widgets/SignTextField.dart';
import 'package:axie_scholarship/enums/pageType.dart';
import 'package:axie_scholarship/enums/textFieldType.dart';
import 'package:axie_scholarship/models/pageSwitcher.dart';
import 'package:axie_scholarship/models/screenSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInEmailPage extends StatefulWidget {
  const SignInEmailPage({Key? key}) : super(key: key);

  @override
  _SignInEmailPageState createState() => _SignInEmailPageState();
}

class _SignInEmailPageState extends State<SignInEmailPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();
  bool errorSignIn = false;
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
        Container(
          margin:
              EdgeInsets.only(top: context.read<ScreenSize>().width * .8147),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      height: context.read<ScreenSize>().width * .01,
                    ),
                    Center(
                      child: Text(
                        "Email or Password Incorrect",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: context.read<ScreenSize>().width * .03,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
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
                            buttonText: "Sign In",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (await context
                                    .read<AuthService>()
                                    .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text)) {
                                } else {
                                  setState(() {
                                    this.errorSignIn = true;
                                  });
                                }
                              }
                            },
                            textColor: Colors.white,
                            backgroundColor: Color(0xFF536DFE),
                            width: context.read<ScreenSize>().width * .45,
                          ),
                          Container(
                            width: context.read<ScreenSize>().width * .16,
                            child: MaterialButton(
                              height: (context.read<ScreenSize>().height) * .05,
                              minWidth:
                                  (context.read<ScreenSize>().width) * .15,
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
                          "Don't have an account? ",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: context.read<ScreenSize>().width * .05,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.montserrat(
                              color: Color(0xff2D7DD2),
                              fontSize: context.read<ScreenSize>().width * .05,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            //TODO : adding the switch to the Sign Up page
                            context
                                .read<PageSwitcher>()
                                .changePage(newPage: PageType.SignUpEmailPage);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

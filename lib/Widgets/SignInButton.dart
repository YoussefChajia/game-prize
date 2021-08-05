import 'package:axie_scholarship/models/screenSize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color textColor, backgroundColor;
  const SignInButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: (context.read<ScreenSize>().height) * .05,
      minWidth: (context.read<ScreenSize>().width) * .15,
      color: this.widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        alignment: Alignment.center,
        width: context.read<ScreenSize>().width * .50,
        height: context.read<ScreenSize>().height * .04,
        child: Text(
          this.widget.buttonText,
          style: GoogleFonts.montserrat(
            color: this.widget.textColor,
            fontWeight: FontWeight.w400,
            fontSize: context.read<ScreenSize>().width * .03,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      onPressed: () => this.widget.onPressed,
    );
  }
}

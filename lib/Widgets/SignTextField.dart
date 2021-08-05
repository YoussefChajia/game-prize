import 'package:axie_scholarship/enums/textFieldType.dart';
import 'package:axie_scholarship/models/screenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class SignTextField extends StatefulWidget {
  final TextFieldType fieldType;
  final TextEditingController? firstPasswordController;
  final TextEditingController textController;
  const SignTextField({
    Key? key,
    required this.fieldType,
    this.firstPasswordController,
    required this.textController,
  }) : super(key: key);

  @override
  _SignTextFieldState createState() => _SignTextFieldState();
}

class _SignTextFieldState extends State<SignTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.read<ScreenSize>().width * .695,
      child: TextFormField(
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(context.read<ScreenSize>().width * 0.15),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(context.read<ScreenSize>().width * 0.15),
            ),
          ),
          filled: true,
          fillColor: Color(0xff514B4A),
          hintText: (widget.fieldType != TextFieldType.SecondPassword)
              ? widget.fieldType.toString().split('.')[1]
              : "Repeat Password",
          hintStyle: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w100,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: context.read<ScreenSize>().width * .02,
            horizontal: context.read<ScreenSize>().width * .04,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(context.read<ScreenSize>().width * 0.15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(context.read<ScreenSize>().width * 0.15),
            ),
          ),
        ),
        controller: widget.textController,
        textAlign: TextAlign.left,
        obscureText: (widget.fieldType == TextFieldType.Password ||
            widget.fieldType == TextFieldType.SecondPassword),
        autocorrect: false,
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        validator: (value) {
          //! validating the textField (email, the same password, etc)
          if (value != null) {
            print(value.length.toString());
            if (value.isEmpty)
              return "Please fill the " +
                  (widget.fieldType != TextFieldType.SecondPassword
                      ? widget.fieldType.toString().split('.')[1]
                      : "Second Password") +
                  " field";
            else if (this.widget.fieldType == TextFieldType.Email &&
                !isEmail(value))
              return "Please enter a valid email";
            else if (value.length < 8 &&
                widget.fieldType == TextFieldType.Password)
              return "Please enter password more than 8 caracters";
            else if (widget.fieldType == TextFieldType.SecondPassword &&
                this.widget.firstPasswordController?.text != value)
              return "Please ensure to type the same password";
            return null;
          }
          return null;
        },
      ),
    );
  }
}

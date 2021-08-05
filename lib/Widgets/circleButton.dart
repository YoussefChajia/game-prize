import 'package:axie_scholarship/models/screenSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//! only one asset is added : either a path to the svg icon or the icon
class CircleButton extends StatefulWidget {
  final Color iconColor, fillColor;
  final VoidCallback onPressed;
  final String? assetPath;
  final IconData? icon;
  const CircleButton(
      {Key? key,
      required this.iconColor,
      required this.onPressed,
      this.assetPath,
      required this.fillColor,
      this.icon})
      : super(key: key);

  @override
  _iurcleButtonState createState() => _iurcleButtonState();
}

class _iurcleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
        minHeight: context.read<ScreenSize>().width * .116,
        minWidth: context.read<ScreenSize>().width * .116,
      ),
      onPressed: () {
        widget.onPressed();
      },
      elevation: 0.0,
      fillColor: widget.fillColor,
      child: widget.assetPath != null
          ? SvgPicture.asset(
              widget.assetPath!,
              color: widget.iconColor,
              width: context.read<ScreenSize>().width * .045,
              height: context.read<ScreenSize>().width * .045,
            )
          : Icon(
              widget.icon,
              color: widget.iconColor,
              size: context.read<ScreenSize>().width * .055,
            ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }
}

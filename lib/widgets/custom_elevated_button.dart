import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? disabledColor;

  @override
  Widget build(BuildContext context) {
    double defaultHorizontalPadding = 10.0;

    Color buttonBackgroundColor = Colors.white;
    double buttonBorderRadius = 20;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return disabledColor == null
                    ? Color.fromRGBO(204, 215, 227, 1)
                    : disabledColor!;

              return buttonColor != null ? buttonColor! : buttonBackgroundColor;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white;

              return Colors.white;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return TextStyle(fontSize: 16);

              return TextStyle(fontSize: 16);
            },
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                );

              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonBorderRadius),
              );
            },
          ),
          minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return Size(double.infinity, 63.0);

              return Size(double.infinity, 63.0);
            },
          ),
        ),
        onPressed: this.onPressed,
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }

  ElevatedButtonWidget(
      {Key? key,
      required this.text,
      this.onPressed,
      this.buttonColor,
      this.disabledColor,
      this.textStyle})
      : super(key: key);
}

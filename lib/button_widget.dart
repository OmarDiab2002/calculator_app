import 'package:flutter/material.dart';
import 'package:xo_app/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  void Function(String value) onPressed;
  ButtonWidget(
      {super.key,
      this.backgroundColor = AppColors.grey,
      this.foregroundColor = AppColors.lightBlue,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: () {
          onPressed(text);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center),
        child: text == ""
            ? Icon(
                Icons.backspace_outlined,
                color: foregroundColor,
                size: 32,
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}

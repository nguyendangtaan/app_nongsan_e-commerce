

  import 'package:client/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

  class AuthButton extends StatelessWidget {
    const AuthButton({
      Key? key,
      required this.fct,
      required this.buttonText,
      this.primary = Colors.white38,
    }) : super(key: key);
    final Function fct;
    final String buttonText;
    final Color primary;
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // không bo tròn
            ),
            ),
            onPressed: () {
              fct();
              // _submitFormOnLogin();
            },
            child: TextWidget(
              text: buttonText,
              textSize: 18,
              color: Colors.white,
            )),
      );
    }
  }

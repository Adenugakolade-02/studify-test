import 'package:flutter/material.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';

class AppButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  const AppButton({super.key, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0xFF9284E1), Color(0xFF5B3FFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Container(
          decoration: BoxDecoration(
            
          ),
          height: 43,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 8,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.whiteBackground,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontType.inter
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
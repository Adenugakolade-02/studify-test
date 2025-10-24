

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';

class QuizTile extends StatelessWidget {
  final String title, subtitle;
  final String iconurl;
  final Color color;
  final VoidCallback fuction;
  const QuizTile({super.key, required this.title, required this.subtitle, required this.iconurl, required this.color, required this.fuction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fuction.call,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        margin: EdgeInsets.only(bottom: 28),
        child: Row(
          children: [
            Container(
              height: 43,
              width: 43,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color
              ),
              child: Image.asset(iconurl, height: 24, width: 24,),
            ),
            const SizedBox(width: 8,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, 
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.textSecondary,
                ),),
                // const SizedBox(height: 12,),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: FontType.inter,
                    color: AppColors.textTietary,
                    fontSize: 12,
        
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
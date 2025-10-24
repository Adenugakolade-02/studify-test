import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';

class QuizInfoTile extends StatelessWidget {
  final String title, subtitle;
  final String iconUrl;
  const QuizInfoTile({super.key, required this.title, required this.subtitle, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          SvgPicture.asset(iconUrl),
          const SizedBox(width: 14,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.textSecondary
                ),
              ),
              const SizedBox(height: 12,),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: FontType.inter,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.textTietary
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
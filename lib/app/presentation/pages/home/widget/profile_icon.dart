import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studify/core/constants/app_svgs.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';

class ProfileIcon extends StatelessWidget {
  final String profileUrl;
  final String rank;
  final String name;
  const ProfileIcon({super.key, required this.profileUrl, required this.rank, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            profileUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 8,),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppSvgs.trophy),
                const SizedBox(width: 8,),
                RichText(
                  text: TextSpan(
                    text: "Rank: ",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontType.inter
                    ),
                    children: [
                      TextSpan(
                        text: rank,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontType.inter
                        )
                      )
                    ]
                  )
                )
              ],
            ),
            Text(
              "Hello, $name.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
                fontSize: 14
              ),
            )
          ],
        )
      ],
    );
  }
}
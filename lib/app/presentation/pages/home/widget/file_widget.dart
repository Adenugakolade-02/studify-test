import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studify/core/constants/app_svgs.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';

class FileWidget extends StatelessWidget {
  final String fileName;
  final String date;
  const FileWidget({super.key, required this.fileName, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteSurface,
        border: Border.all(
          width: 0.2,
          color: AppColors.borderSurface
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppSvgs.notes),
          const SizedBox(width: 16,),
          SizedBox(
            height: 44,
            child: VerticalDivider(color: AppColors.borderSurface, width: 2,)),
          
          const SizedBox(width: 16,),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    fileName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.textSecondary
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily: FontType.inter,
                    color: AppColors.textTietary,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
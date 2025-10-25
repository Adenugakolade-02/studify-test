import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studify/app/presentation/pages/home/provider/home_provider.dart';
import 'package:studify/core/constants/app_svgs.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';

class PointsWidget extends ConsumerWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteSurface,
        borderRadius: BorderRadius.circular(900),
        border: Border.all(
          color: AppColors.borderSurface,
          width: .2
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${ref.watch(homeProvider).userPoints}",
            style: TextStyle(
              color: AppColors.textTietary,
              fontFamily: FontType.inter,
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(width: 6,),
          SvgPicture.asset(AppSvgs.score)
        ],
      ),
    );
  }
}
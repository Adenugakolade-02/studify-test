import 'package:flutter/material.dart';
import 'package:studify/core/theme/color.dart';

// ignore: must_be_immutable
class CongratulationsInfoTile extends StatelessWidget {
  final String info;
  final Widget detail;
  bool isLast;
  CongratulationsInfoTile({super.key, required this.info, required this.detail, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: !isLast? Border(bottom: BorderSide(width: .5, color: AppColors.borderSurface)) : null
      ),
      padding: EdgeInsets.symmetric(vertical: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.textTietary,
              fontSize: 14
            ),
          ),
          detail
        ],
      ),
    );
  }
}
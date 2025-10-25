import 'package:flutter/material.dart';
import 'package:studify/core/router/router.dart';
import 'package:studify/core/theme/color.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback fuction;
  const AppBackButton({super.key, required this.fuction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      margin: EdgeInsets.only(left: 19),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteSurface,
        border: Border.all(width: 0.2, color: AppColors.borderSurface)
      ),
      child: IconButton(
        onPressed: (){
          if(AppRoute.canPop() ?? false){
            AppRoute.pop();
          }
        }, 
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textTietary,), padding: EdgeInsets.zero,),
    );
  }
}
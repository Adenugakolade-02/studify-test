import 'package:flutter/material.dart';
import 'package:studify/app/presentation/pages/home/widget/quiz_tile.dart';
import 'package:studify/core/constants/app_images.dart';
import 'package:studify/core/theme/color.dart';

class QuizBottomSheet extends StatelessWidget {
  const QuizBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 24, ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(blurRadius: 5.7, color: Colors.black.withValues(alpha: .08))
              ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QuizTile(title: "Study mode", subtitle: "Learn at your pace. No pressure.", iconurl: AppImages.quizStudy, color: Color(0xFFFBE6DF), fuction: (){},),
                QuizTile(title: "Single Quiz", subtitle: "Test your speed and accuracy.", iconurl: AppImages.quizUser, color: Color(0xFFFCDEF0), fuction: (){},),
                QuizTile(title: "Competition Quiz", subtitle: "Compete with peers, climb the ranks.", iconurl: AppImages.competitionQuiz, color: Color(0xFFDBF5FF), fuction: (){},),
              ],
            ),
          ),
          const SizedBox(height: 26,),
          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: AppColors.borderSurface,
                shape: BoxShape.circle
              ),
              child: const Icon(Icons.close, color: AppColors.textTietary,),
            ),
          )
        ],
      ),
    );
  }
}
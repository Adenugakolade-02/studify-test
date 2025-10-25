import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studify/app/presentation/pages/quiz/widget/quiz_info_tile.dart';
import 'package:studify/app/presentation/widgets/app_button.dart';
import 'package:studify/app/presentation/widgets/back_button.dart';
import 'package:studify/core/constants/app_svgs.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/extensions/context_extension.dart';
import 'package:studify/core/router/router.dart';
import 'package:studify/core/theme/color.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(fuction: (){}),
        title: const Text("Study mode"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 19),
          child: SingleChildScrollView(
            child: SizedBox(
              height: context.screenSize.height -130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18,),
                  SvgPicture.asset(AppSvgs.notes),
                  const SizedBox(height: 17,),
                  Text(
                    "Summary",
                    style: TextStyle(
                      fontFamily: FontType.inter,
                      color: AppColors.textTietary,
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    "Assembly Programming Guide",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.textPrimary
                    ),
                  ),
                  const SizedBox(height: 48,),
                  QuizInfoTile(title: "30 Questions ", subtitle: "You will be given 30 questions in quiz", iconUrl: AppSvgs.question),
                  QuizInfoTile(title: "No time limit", subtitle: "Self-paced lets you set a high score and break it.", iconUrl: AppSvgs.clock),
                  QuizInfoTile(title: "Grading and points", subtitle: "1 pt for quiz completion, 3 pts for a correct answer.", iconUrl: AppSvgs.check),
                  const Spacer(),
                  Center(
                    // alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 173,
                      child: AppButton(
                        icon: SizedBox(), 
                        text: "Proceed", 
                        onPressed: ()=>AppRoute.go(AppRoute.activeQuizScreen)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
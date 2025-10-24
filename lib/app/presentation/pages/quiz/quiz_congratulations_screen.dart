import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:studify/app/presentation/pages/quiz/widget/congratulations_info_tile.dart';
import 'package:studify/app/presentation/widgets/app_button.dart';
import 'package:studify/app/presentation/widgets/aurora_background.dart';
import 'package:studify/core/constants/app_images.dart';
import 'package:studify/core/constants/app_svgs.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/router/router.dart';
import 'package:studify/core/theme/color.dart';

class QuizCongratulationsScreen extends StatefulWidget {
  const QuizCongratulationsScreen({super.key});

  @override
  State<QuizCongratulationsScreen> createState() => _QuizCongratulationsScreenState();
}

class _QuizCongratulationsScreenState extends State<QuizCongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuroraBackground(),
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                // shrinkWrap: true,
                
                children: [
                  const SizedBox(height: 72,),
                  Image.asset(
                    AppImages.winnerTrophy,
                    height: 163,
                    width: 163,
                    ),
                  const SizedBox(height: 29,),
                  Text(
                    "You crushed it!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.textPrimary
                    ),
                  ),
                  Text(
                    "You’re getting sharper every quiz.",
                    style: TextStyle(
                      fontFamily: FontType.inter,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.textTietary
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "+20",
                          style: TextStyle(
                            fontFamily: FontType.inter,
                            fontSize: 12,
                            color: AppColors.textTietary,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(width: 2,),
                        SvgPicture.asset(AppSvgs.score),
                        const SizedBox(width: 2,),
                        Text(
                          "earned",
                          style: TextStyle(
                            fontFamily: FontType.inter,
                            fontSize: 12,
                            color: AppColors.textTietary,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 19),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.whiteBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: .5, color: AppColors.borderSurface)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CongratulationsInfoTile(info: "Total Score", detail: Row(mainAxisSize: MainAxisSize.min, children: [textWidget("+20"), SvgPicture.asset(AppSvgs.score)],)),
                        CongratulationsInfoTile(info: "Accuracy", detail: textWidget("76%")),
                        CongratulationsInfoTile(info: "Time Taken", detail: textWidget("2m 43s")),
                        CongratulationsInfoTile(info: "Rank (Placeholder)", detail: textWidget("12th / 50"), isLast: true,)
                      ],
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, right: 19, left: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: ()=>AppRoute.go(AppRoute.activeQuizScreen), child: Text("Retry quiz")),
                        Container(
                          constraints: BoxConstraints(maxWidth: 196),
                          child: AppButton(icon: SizedBox(), text: "Return home", onPressed: ()=>AppRoute.go(AppRoute.homeScreen)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height *.4,
              child: Lottie.asset(
                "assets/images/Confetti.json",
                // width: 
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget textWidget(String text){
    return Text(
      text,
      style: TextStyle(
        fontFamily: FontType.inter,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        fontSize: 14
      ),
    );
  }
}
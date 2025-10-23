import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studify/app/presentation/pages/Home/widget/profile_icon.dart';
import 'package:studify/app/presentation/pages/home/widget/file_widget.dart';
import 'package:studify/app/presentation/widgets/app_button.dart';
import 'package:studify/core/constants/app_images.dart';
import 'package:studify/core/constants/app_svgs.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';
import 'package:studify/core/theme/theme.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: ProfileIcon(
      //     profileUrl: AppImages.profileUrl, 
      //     rank: "12th", 
      //     name: "Divine"
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProfileIcon(
                    profileUrl: AppImages.profileUrl, 
                    rank: "12th", 
                    name: "Divine"
                  ),
                  const Spacer(),
                  Container(
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
                          "133",
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
                  )
                ],
              ),
              const SizedBox(height: 40,),
              Text(
                "Your recents",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.textTietary,
                ),
              ),
              const SizedBox(height: 32,),
              FileWidget(fileName: "Biology Notes - Chapter 5.pdf", date: "Oct 9, 2025"),
              FileWidget(fileName: "Chemistry Lab Report - Experiment 3.docx", date: "Oct 9, 2025"),
              FileWidget(fileName: "Physics Assignment - Kinematics.pptx", date: "Oct 9, 2025"),
              const Spacer(), 
              Center(
                child: SizedBox(
                  width: 173,
                  child: AppButton(
                    icon: Icon(Icons.add), 
                    text: "Upload new file", 
                    onPressed: (){}
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
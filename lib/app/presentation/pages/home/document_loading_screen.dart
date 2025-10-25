import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studify/app/presentation/widgets/aurora_background.dart';
import 'package:studify/core/constants/app_images.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/router/router.dart';
import 'package:studify/core/theme/color.dart';

class DocumentLoadingScreen extends StatefulWidget {
  const DocumentLoadingScreen({super.key});

  @override
  State<DocumentLoadingScreen> createState() => _DocumentLoadingScreenState();
}

class _DocumentLoadingScreenState extends State<DocumentLoadingScreen> {
  int _currentStep = 0;
  
  final List<String> progressSteps = [
    "Scanning your document…",
    "Generating summary...",
    "Extracting questions…"
  ];

  void simulatingNextStep(){
    Timer.periodic(Duration(seconds: 1), (timer){
      if(_currentStep<progressSteps.length){
        setState(() {
          _currentStep = _currentStep+1;
        });
      }else{
        timer.cancel();
        Future.delayed(
          Duration(milliseconds: 500), (){
            AppRoute.go(AppRoute.textSummaryScreen);
          }
        );
      }
    });
  }
  @override
  void initState() {
    super.initState();
    simulatingNextStep();
    
  }
  @override
  Widget build(BuildContext context) {
    final currentTextKey = ValueKey<int>(_currentStep);
    return Scaffold(
      body: Stack(
        children: [
          AuroraBackground(),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 19),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 136,
                    width: 136,
                    child: Image.asset(AppImages.documentImage),
                  ),
                  const SizedBox(height: 20,),
                  if (_currentStep == progressSteps.length )
                    Text(
                      "Scan complete!",
                      style: TextStyle(
                        fontFamily: FontType.inter,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.textSecondary
                      ),
                    )
                  else ...[
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation){
                        final isEntering = (child.key == currentTextKey);
                        final beginOffset = isEntering
                          ? const Offset(0, .5) //Enters from below
                          : const Offset(0, -.5); // exits towards the top
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween(
                              begin: beginOffset,
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        progressSteps[_currentStep],
                        key: ValueKey<int>(_currentStep),
                        style: TextStyle(
                          fontFamily: FontType.inter,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textSecondary,
                          fontSize: 16
                        ),
                      ),
                    ),
                    const SizedBox(height: 29,),
                    SizedBox(
                      width: 112,
                      child: LinearProgressIndicator()
                    ),
                    Text(
                      "Analyzing ...",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textTietary,
                        fontSize: 12
                      ),
                    )
                  ]
                ],
              ),
            ),
          )
          
        ],
      ),
    );
  }
}
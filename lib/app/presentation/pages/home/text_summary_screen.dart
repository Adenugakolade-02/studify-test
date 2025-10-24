import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studify/app/presentation/pages/home/widget/quiz_bottomsheet.dart';
import 'package:studify/app/presentation/widgets/app_button.dart';
import 'package:studify/app/presentation/widgets/back_button.dart';
import 'package:studify/core/constants/app_svgs.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/theme/color.dart';
// import 'package:studify/core/extensions/context_extension.dart';

class TextSummaryScreen extends ConsumerStatefulWidget {
  const TextSummaryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextSummaryScreenState();
}

class _TextSummaryScreenState extends ConsumerState<TextSummaryScreen> {

  void _showQuizOption(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4
          ),
          child: const QuizBottomSheet(),
        );
      },
      backgroundColor: Colors.transparent
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(fuction: (){}),
        title: const Text("Summary"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 19),
              child: ShaderMask(
                shaderCallback: (Rect bounds){
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.65,1],
                    colors: [AppColors.whiteBackground, AppColors.whiteBackground.withValues(alpha: .001)]
                    ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    const SizedBox(height: 16,),
                    Text(
                      "Oct 9, 2025",
                      style: TextStyle(
                        fontFamily: FontType.inter,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textTietary
                      ),
                    ),
                    const SizedBox(height: 43,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          "The provided excerpts come from a document titled \"CSC 221 - Computer Architecture and Orga.pdf\" which appears to be a Basic Computer Architecture manual compiled by Etuk David. This academic text, seemingly from the University of Uyo, functions as a practical guide for learning x86 and 8086 assembly programming. The manual uses numerous code examples and explanations of assembly language instructions, particularly focusing on the use of the emu8086 microprocessor emulator and related tools. The content systematically covers foundational topics such as computer architecture and organization, memory access, variables, arrays, and constants, interrupts, arithmetic and logic instructions, program flow control (jumps), procedures, the stack, and macros. The manual uses numerous code examples and explanations of assembly language instructions, particularly focusing on the use of the emu8086 microprocessor emulator and related tools. /nThe provided excerpts come from a document titled \"CSC 221 - Computer Architecture and Orga.pdf\" which appears to be a Basic Computer Architecture manual compiled by Etuk David. This academic text, seemingly from the University of Uyo, functions as a practical guide for learning x86 and 8086 assembly programming. The manual uses numerous code examples and explanations of assembly language instructions, particularly focusing on the use of the emu8086 microprocessor emulator and related tools. The content systematically covers foundational topics such as computer architecture and organization, memory access, variables, arrays, and constants, interrupts, arithmetic and logic instructions, program flow control (jumps), procedures, the stack, and macros. The manual uses numerous code examples and explanations of assembly language instructions, particularly focusing on the use of the emu8086 microprocessor emulator and related tools.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppColors.textSecondary
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
            if(context.mounted)
              Positioned.fill(
                child: Align(
                  alignment: Alignment(0, .9),
                  child: SizedBox(
                    width: 173,
                    child: AppButton(
                      icon: SvgPicture.asset(AppSvgs.stars), 
                      text: "Start quiz", 
                      onPressed: ()=>_showQuizOption(context)
                    )
                  ),
                )
              )
          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:studify/app/presentation/pages/quiz/widget/option_tile.dart';
import 'package:studify/core/theme/color.dart';

class QuizQuestionPage extends StatefulWidget {
  // final PageController pageController;
  final int questionId;
  final String question;
  final List<String> options;
  final int correctId;
  final int? selectedId;
  final Function(int, int) function;

  const QuizQuestionPage({super.key,required this.question,required this.correctId, this.selectedId, required this.options, required this.function, required this.questionId});

  @override
  State<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(widget.question,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: AppColors.textPrimary
          ),
        ),
        const SizedBox(height: 66,),
        ...List.generate(
          widget.options.length, 
          (index){
            final option = widget.options[index];
            return OptionTile(
              option: option,
              questionId: widget.questionId,
              id: index, 
              correctId: widget.correctId, 
              callback: widget.function
            );
          }
        ),

      ],
    );
  }
}
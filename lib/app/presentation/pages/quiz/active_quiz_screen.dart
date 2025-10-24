import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:studify/app/data/quiz_model.dart';
import 'package:studify/app/presentation/pages/home/widget/points_widget.dart';
import 'package:studify/app/presentation/pages/quiz/widget/quiz_question_page.dart';
import 'package:studify/app/presentation/widgets/app_button.dart';
import 'package:studify/app/presentation/widgets/back_button.dart';
import 'package:studify/core/constants/font_type.dart';
import 'package:studify/core/router/router.dart';
import 'package:studify/core/theme/color.dart';

class ActiveQuizScreen extends StatefulWidget {
  const ActiveQuizScreen({super.key});

  @override
  State<ActiveQuizScreen> createState() => _ActiveQuizScreenState();
}

class _ActiveQuizScreenState extends State<ActiveQuizScreen> {

  late PageController controller;
  int _currentPage = 0;

  int _seconds =0;
  Timer? _timer;

  @override
  void initState() {
    controller = PageController(initialPage: _currentPage)..addListener((){
      setState(() {
        _currentPage = controller.page!.round();
      });
    });
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        _seconds++;
      });
    });
  }
  
  final List<QuizModel> computerQuizQuestions = [
    QuizModel(
      question: "When a computer first powers on, it runs a Power-On Self-Test (POST) and initialises hardware. Which firmware is responsible for this initial boot-up sequence before the main operating system is loaded?",
      optionList: [
        "A. The GPU Driver",
        "B. The Kernel",
        "C. The BIOS or UEFI",
        "D. The Bootloader"
      ],
      answerId: 2,
    ),
    QuizModel(
      question: "What does 'SaaS' stand for in cloud computing?",
      optionList: [
        "A. System as a Service",
        "B. Software as a Service",
        "C. Security as a Service",
        "D. Storage as a Service"
      ],
      answerId: 1,
    ),
    QuizModel(
      question: "When setting up user accounts on a corporate server, a system administrator grants each user only the essential permissions required to perform their job. This practice, which enhances security by limiting potential damage from accidents or compromised accounts, is known as what principle?",
      optionList: [
        "A. The Principle of Open Access",
        "B. The Principle of Least Privilege",
        "C. The Principle of Full Control",
        "D. The Principle of Redundancy"
      ],
      answerId: 1,
    ),
    QuizModel(
      question: "Which of these protocols is primarily used for sending email from a client to a server?",
      optionList: [
        "A. FTP (File Transfer Protocol)",
        "B. HTTP (Hypertext Transfer Protocol)",
        "C. POP3 (Post Office Protocol 3)",
        "D. SMTP (Simple Mail Transfer Protocol)"
      ],
      answerId: 3,
    ),
    QuizModel(
      question: "In object-oriented programming, encapsulation is a fundamental concept where the internal state of an object is protected from outside access. How is this typically achieved in languages like Java or C#?",
      optionList: [
        "A. By making all methods static.",
        "B. By declaring all data fields as 'public'.",
        "C. By bundling data and methods in a single unit.",
        "D. By declaring data fields as 'private' and providing public methods (getters/setters) for access."
      ],
      answerId: 3,
    ),
  ];
  Map<int, int> quizAnswers = {};

  void selectOption(int questionId, int selectedId){
    if(!quizAnswers.containsKey(questionId)){
      quizAnswers[questionId] = selectedId;
      setState(() {
      });
      log(quizAnswers.toString());
    }
  }

  String _formatTime() {
    final int minutes = _seconds ~/ 60; // Integer division for minutes
    final int seconds = _seconds % 60;  // Remainder for seconds

    final String minutesStr = minutes.toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');

    return '$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 19),
        leading: AppBackButton(fuction: (){}),
        title: Text(
          _formatTime(),
          style: TextStyle(
            fontFamily: FontType.spaceGrotesk,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: AppColors.textSecondary
          ),
        ),
        actions: [
          PointsWidget()
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Question ${_currentPage+1}/${computerQuizQuestions.length}"
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: computerQuizQuestions.length,
                itemBuilder: (context, index){
                  return QuizQuestionPage(
                    question: computerQuizQuestions[index].question,
                    questionId: index, 
                    correctId: computerQuizQuestions[index].answerId, 
                    options: computerQuizQuestions[index].optionList,
                    selectedId: quizAnswers[index],
                    function: selectOption,
                  );
                } ,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 19, right: 19, bottom: 35),
        child: Row(
          children: [
            TextButton(
              onPressed: (){
                if(_currentPage!=0){
                  controller.previousPage(
                    duration: const Duration(milliseconds: 200), 
                    curve: Curves.easeOut
                  );
                }
              }, 
              child: Text("Back")
            ),
            const Spacer(),
            SizedBox(
              width: 196,
              child: _currentPage+1 == computerQuizQuestions.length
              ? AppButton(
                icon: SizedBox(), 
                text: "Submit", 
                onPressed: ()=>AppRoute.go(AppRoute.quizCongratulationsScreen)
              )
              : AppButton(
                icon: SizedBox(), 
                text: "Next", 
                onPressed: (){
                  controller.nextPage(
                    duration: const Duration(milliseconds: 200), 
                    curve: Curves.easeIn
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:studify/app/presentation/pages/Home/home_screen.dart';
import 'package:studify/app/presentation/pages/home/document_loading_screen.dart';
import 'package:studify/app/presentation/pages/home/text_summary_screen.dart';
import 'package:studify/app/presentation/pages/quiz/active_quiz_screen.dart';
import 'package:studify/app/presentation/pages/quiz/quiz_congratulations_screen.dart';
import 'package:studify/app/presentation/pages/quiz/quiz_home_screen.dart';
import 'package:studify/core/router/router.dart';

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoute.homeScreen:
        return _buildRoute(const HomeScreen());
      case AppRoute.textSummaryScreen:
        return _buildRoute(const TextSummaryScreen());
      case AppRoute.documentLoadingScreen:
        return _buildRoute(const DocumentLoadingScreen());
      case AppRoute.activeQuizScreen:
        return _buildRoute(const ActiveQuizScreen());
      case AppRoute.quizCongratulationsScreen:
        return _buildRoute(const QuizCongratulationsScreen());
      case AppRoute.quizHomeScreen:
        return _buildRoute(const QuizHomeScreen());
      default:
        return _buildRoute(const Scaffold(body: Center(child: Text("Invalid route reached"),),));
    }
  }
}

Widget _transitionHandler(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    var begin = const Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return FadeTransition(opacity: animation, child: SlideTransition(position: animation.drive(tween), child: child,),);
  }

  Duration _forward() {
    return const Duration(milliseconds: 200);
  }

  Duration _reverse() {
    return const Duration(milliseconds: 200);
  }

  PageRouteBuilder _buildRoute(Widget child, { RouteSettings? settings }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: _transitionHandler, transitionDuration: _forward(), reverseTransitionDuration: _reverse(),
    );
  }
import 'package:studify/core/services/navigation_service.dart';

class AppRoute{
  static const homeScreen = '/homeScreen';
  static const textSummaryScreen = '/textSummaryScreen';
  static const documentLoadingScreen = '/documentLoadingScreen';

  static const activeQuizScreen = '/activeQuizScreen';
  static const quizCongratulationsScreen = '/quizCongratulationsScreen';
  static const quizHomeScreen = '/quizHomeScreen';


  static Future go(String destination, { dynamic arguments, bool? pop, bool? popAll }) async {
    if (pop == true) {
      return await NavigatorService.instance.popNavigateTo(destination, arguments: arguments);
    } else if (popAll == true) {
      return await NavigatorService.instance.popAllNavigateTo(destination, arguments: arguments);
    } else {
      return await NavigatorService.instance.navigateTo(destination, arguments: arguments);
    }
  }

  static pop<T extends Object>([T? result]) {
    return NavigatorService.instance.pop(result);
  }

  static bool? canPop(){
    return NavigatorService.instance.canPop();
  }
}
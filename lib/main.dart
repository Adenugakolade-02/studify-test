import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studify/app/presentation/pages/Home/home_screen.dart';
import 'package:studify/core/router/app_routes.dart';
import 'package:studify/core/services/navigation_service.dart';
import 'package:studify/core/theme/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('file_cache_box');
  await Hive.openBox('score_box');
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: HomeScreen(),
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: NavigatorService.instance.navigatorKey,
    );
  }
}

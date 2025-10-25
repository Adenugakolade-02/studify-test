import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studify/app/presentation/pages/Home/widget/profile_icon.dart';
import 'package:studify/app/presentation/pages/home/provider/home_provider.dart';
import 'package:studify/app/presentation/pages/home/widget/file_widget.dart';
import 'package:studify/app/presentation/pages/home/widget/points_widget.dart';
import 'package:studify/app/presentation/widgets/app_button.dart';
import 'package:studify/core/constants/app_images.dart';
import 'package:studify/core/extensions/context_extension.dart';
import 'package:studify/core/extensions/datetime_extension.dart';
import 'package:studify/core/router/router.dart';
import 'package:studify/core/theme/color.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    final homeNotifier = ref.read(homeProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: SingleChildScrollView(
            child: SizedBox(
              height: context.screenSize.height -100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 17,),
                  Row(
                    children: [
                      ProfileIcon(
                        profileUrl: AppImages.profileUrl, 
                        rank: "12th", 
                        name: "Divine"
                      ),
                      const Spacer(),
                      PointsWidget()
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
                  if(homeState.cacheFiles.isEmpty)
                    Center(child: Text("No Files selected, Add new files"))
                  else
                    ...List.generate(
                      homeState.cacheFiles.length,
                      (index){
                        return FileWidget(fileName: homeState.cacheFiles[index].name, date: homeState.cacheFiles[index].date.toMonthDayYear(), callback: ()=>AppRoute.go(AppRoute.documentLoadingScreen),);
                      }
                    ),
                
                  const Spacer(), 
                  // const SizedBox(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 173,
                      child: AppButton(
                        icon: Icon(Icons.add), 
                        text: "Upload new file", 
                        onPressed: (){
                          homeNotifier.pickandCacheFile().then((value){
                            if(value){
                              AppRoute.go(AppRoute.documentLoadingScreen);
                          }
                        });
                        }
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
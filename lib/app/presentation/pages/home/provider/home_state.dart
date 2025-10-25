import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:studify/app/data/cached_file_model.dart';

class HomeState extends Equatable{
  final List<CachedFileModel> cacheFiles;
  final int userPoints;

  HomeState({
    List<CachedFileModel>? cacheFiles,
    int? userPoints,
    })
      : cacheFiles = cacheFiles ?? [],
        userPoints = userPoints ?? 138;

  HomeState copyWith({
    List<CachedFileModel>? cacheFiles,
    int? userPoints,
    Box? cachedBox,
    Box? scoreBox
  }){
    return HomeState(
      cacheFiles: cacheFiles ?? this.cacheFiles,
      userPoints: userPoints ?? this.userPoints,
    );
  }
  
  @override
  List<Object?> get props => [
    cacheFiles,
    userPoints,
  ];
}
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hive/hive.dart';
import 'package:studify/app/data/models/cached_file_model.dart';
import 'package:studify/app/presentation/pages/home/provider/home_state.dart';

final homeProvider = StateNotifierProvider<HomeStateNotifier, HomeState>((ref)=> HomeStateNotifier());

class HomeStateNotifier extends StateNotifier<HomeState>{
  late final Box _cacheBox;
  late final Box _scoreBox;
  
  HomeStateNotifier():super(HomeState()){
    _cacheBox = Hive.box('file_cache_box');
    _scoreBox = Hive.box('score_box');

    loadCacheFiles();
  }
  
  

  void loadCacheFiles(){
    final cacheList = _cacheBox.values.map((mapValue)=> CachedFileModel.fromJson(mapValue)).toList();
    final score = _scoreBox.get('score') as int?;
    state = state.copyWith(cacheFiles: cacheList, userPoints: score);
  }

  void updateUserPoint(int score){
    final updatedScore = state.userPoints + score;
    _scoreBox.put('score', updatedScore);
    state = state.copyWith(userPoints: updatedScore);
  }

  Future<bool> pickandCacheFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(withData: true);
    try{
        if(result !=null && result.files.first.bytes != null){
        PlatformFile file = result.files.first;

        final newCacheFile = CachedFileModel(
          name: file.name, 
          file: file.bytes!, 
          date: DateTime.now()
        );

        _cacheBox.put(newCacheFile.name, newCacheFile.toJson());
        final updatedList = [...state.cacheFiles, newCacheFile];
        state = state.copyWith(cacheFiles: updatedList);
        return true;
      }else{
        return false;
      } 
    } catch(e){
      return false;
    }
  }
}
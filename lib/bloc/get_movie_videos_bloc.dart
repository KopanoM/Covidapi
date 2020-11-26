import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdartexample/model/video_response.dart';
import 'package:rxdartexample/repo/MovieRepository.dart';

class MovieVideosBloc{
  final MovieRepository repository = MovieRepository();
  BehaviorSubject<VideoResponse> _subject = BehaviorSubject<VideoResponse>();


  @mustCallSuper
  void drainStream(){
    _subject.value = null;
  }
  void dispose()async{
    await _subject.drain();
    _subject.close();
  }
  getVideos(int id)async{
    VideoResponse response = await repository.getMovieVideos(id);
    _subject.sink.add(response);
  }

  BehaviorSubject<VideoResponse> get subject => _subject;
}
final movieVideosBloc = MovieVideosBloc();

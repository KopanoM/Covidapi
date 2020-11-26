import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdartexample/model/cast_response.dart';
import 'package:rxdartexample/model/movie_detail_response.dart';
import 'package:rxdartexample/repo/MovieRepository.dart';

class MovieDetailBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieDetailResponse> _subject = BehaviorSubject<MovieDetailResponse>();

  getMovieDetail(int id)async{
    MovieDetailResponse response = await _repository.getMoviesDetail(id);
    _subject.sink.add(response);

  }
  @mustCallSuper
  void dispose()async{
    await _subject.drain();
    _subject.close();
  }
  void drainSteam(){
    _subject.value = null;
  }

  BehaviorSubject<MovieDetailResponse> get subject => _subject;
}
final movieDetailBloc = MovieDetailBloc();
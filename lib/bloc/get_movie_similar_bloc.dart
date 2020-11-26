import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdartexample/model/cast_response.dart';
import 'package:rxdartexample/model/movie_detail_response.dart';
import 'package:rxdartexample/model/movie_response.dart';
import 'package:rxdartexample/repo/MovieRepository.dart';

class SimilarMoviesBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getSimilarMovies(int id)async{
    MovieResponse response = await _repository.getSimilarDetail(id);
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

  BehaviorSubject<MovieResponse> get subject => _subject;
}
final similarMoviesBloc = SimilarMoviesBloc();
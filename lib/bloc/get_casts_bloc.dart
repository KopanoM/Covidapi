import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdartexample/model/cast_response.dart';
import 'package:rxdartexample/repo/MovieRepository.dart';

class CastsBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<CastResponse> _subject = BehaviorSubject<CastResponse>();

  getCasts(int id)async{
    CastResponse castResponse = await _repository.getCast(id);
    _subject.sink.add(castResponse);

  }
  @mustCallSuper
  void dispose()async{
    await _subject.drain();
    _subject.close();
  }
  void drainSteam(){
    _subject.value = null;
  }

  BehaviorSubject<CastResponse> get subject => _subject;

}
final castBloc = CastsBloc();
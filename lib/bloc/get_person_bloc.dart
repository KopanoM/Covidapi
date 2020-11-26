import 'package:rxdart/rxdart.dart';
import 'package:rxdartexample/model/movie_response.dart';
import 'package:rxdartexample/model/person_response.dart';
import 'package:rxdartexample/repo/MovieRepository.dart';

class PersonListBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
  BehaviorSubject<PersonResponse>();


  getPersons() async{
    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }
  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personBloc = PersonListBloc();
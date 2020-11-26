import 'package:rxdartexample/model/movie.dart';
import 'package:rxdartexample/model/person.dart';

class PersonResponse{
  final List<Person> person;
  String error;

  PersonResponse(this.person,this.error);

  PersonResponse.fromJson(Map<String, dynamic> json)
      : person =
  (json['results'] as List).map((i) => Person.fromJson(i)).toList(),
        error = "";

  PersonResponse.withError(String errorValue)
      : person = List(),
        error = errorValue;

}
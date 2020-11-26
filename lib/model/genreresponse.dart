import 'package:rxdartexample/model/genre.dart';

class GenreResponse{
  final List<Genre> genre;
  final String error;

  GenreResponse(this.genre,this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
  : genre = (json['genres'] as List).map((e) => Genre.fromJson(e)).toList(),
  error = "";

  GenreResponse.withError(String error)
  : genre = List(),
  error = error;



}
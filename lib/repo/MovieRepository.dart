import 'package:dio/dio.dart';
import 'package:rxdartexample/model/cast_response.dart';
import 'package:rxdartexample/model/genreresponse.dart';
import 'package:rxdartexample/model/movie_detail_response.dart';
import 'package:rxdartexample/model/movie_response.dart';
import 'package:rxdartexample/model/person_response.dart';
import 'package:rxdartexample/model/video_response.dart';

class MovieRepository{
  final String apiKey = "afe12e978611e6783529045cfc80ab53";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl =  '$mainUrl/movie/top_rated';
  var getMoviesUrl =  '$mainUrl/discover/movie';
  var getPlayingUrl =  '$mainUrl/movie/now_playing';
  var getGentresUrl =  '$mainUrl/genre/movie/list';
  var getPersonsUrl =  '$mainUrl/trending/person/week';
  var movieUrl =  '$mainUrl/movie';

  Future<MovieResponse> getMovies() async{
    var params = {
      "api_key": apiKey,
      //"language": "en-US",
      //"page": 1
    };

    try{
      Response response =await _dio.get(getPopularUrl,queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch(e){
      print(e);
      String err = e.toString();
      return MovieResponse.withError(err);
    }

  }

  Future<MovieResponse> getPlayingMovies() async{
    var params = {
      "api_key": apiKey,
      //"language": "en-US",
      //"page": 1
    };
    try{
      Response response = await Dio().get(getPlayingUrl,queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch(e){
      print(e);
      return MovieResponse.withError("$e");
    }

  }

  Future<PersonResponse> getPersons() async{
    var params = {
      "api_key": apiKey,
    };
    try{
      Response response = await Dio().get(getPersonsUrl,queryParameters: params);
      return PersonResponse.fromJson(response.data);
    }catch(e){
      print(e);
      return PersonResponse.withError("$e");
    }

  }

  Future<GenreResponse> getGenres() async{
    var params = {
      "api_key": apiKey,
      //"language": "en-US",
      //"page": 1
    };

    try{
      Response response = await Dio().get(getGentresUrl,queryParameters: params);
      return GenreResponse.fromJson(response.data);
    }catch(e){
      print(e);
      return GenreResponse.withError("$e");
    }

  }

  Future<MovieResponse> getMoviesByGenre(int id) async{
    var params = {
      "api_key": apiKey,
      //"language": "en-US",
      //"page": 1,
      "with_genres": id
    };

    try{
      Response response = await Dio().get(getMoviesUrl,queryParameters: params);
      return MovieResponse.fromJson(response.data);
    }catch(e){
      print(e);
      return MovieResponse.withError("$e");
    }

  }
  Future<MovieDetailResponse> getMoviesDetail(int id) async{
    var params = {
      "api_key":apiKey,


    };

    try{
      Response response = await Dio().get(movieUrl + "/$id",queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);

    }catch(e){
      return MovieDetailResponse.withError(e.toString());
    }

  }

  Future<CastResponse> getCast(int id) async{
    var params = {
      "api_key":apiKey,


    };

    try{
      Response response = await Dio().get(movieUrl + "/$id"+ "/credits",queryParameters: params);
      return CastResponse.fromJson(response.data);

    }catch(e){
      return CastResponse.withError(e.toString());
    }

  }

  Future<MovieResponse> getSimilarDetail(int id) async{
    var params = {
      "api_key":apiKey,


    };

    try{
      Response response = await Dio().get(movieUrl + "/$id"+ "/similar",queryParameters: params);
      return MovieResponse.fromJson(response.data);

    }catch(e){
      return MovieResponse.withError(e.toString());
    }

  }

  Future<VideoResponse> getMovieVideos(int id) async{
    var params = {
      "api_key":apiKey,
    };

    try{
      Response response = await Dio().get(movieUrl + "/$id"+ "/videos",queryParameters: params);
      return VideoResponse.fromJson(response.data);

    }catch(e){
      return VideoResponse.withError(e.toString());
    }
  }


}
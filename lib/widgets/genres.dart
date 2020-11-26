import 'package:flutter/material.dart';
import 'package:rxdartexample/bloc/get_genres_bloc.dart';
import 'package:rxdartexample/model/genre.dart';
import 'package:rxdartexample/model/genreresponse.dart';
import 'package:rxdartexample/widgets/genres_list.dart';
class GenreScreen extends StatefulWidget {
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genresBloc..getGenres();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genresBloc.subject.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot){
        if(snapshot.hasData){
          if(snapshot.data.error !=null && snapshot.data.error.length>0){
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildGenresWidget(snapshot.data);
        }else if(snapshot.hasError){
          return buildErrorWidget(snapshot.error);
        }else{
          return _buildLoadingWidget();
        }
      },

    );

  }
  Widget _buildGenresWidget(GenreResponse data){
    List<Genre> genres = data.genre;
    if(genres.length == 0){
      return Container(
        child: Text("No Genre"),
      );
    }else return GenresList(genres: genres);

  }
  Widget buildErrorWidget(String error) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Error Occured: $error")
        ],
      ),
    );
  }
  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )

        ],
      ),
    );
  }
}

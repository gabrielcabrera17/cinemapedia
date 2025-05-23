import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {

//Este repository llamara el data source
  Future<List<Movie>> getNowPlaying({ int page = 1});

  
//populares
  Future<List<Movie>> getPopular({ int page = 1});

//upComing
Future<List<Movie>> getUpcoming({ int page = 1});

//top raider
Future<List<Movie>> getTopRated({ int page = 1});

//obtener una pelicula
Future<Movie> getMovieById(String id);

}
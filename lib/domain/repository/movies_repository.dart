import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {

//Este repository llamara el data source
  Future<List<Movie>> getNowPlaying({ int page = 1});

}
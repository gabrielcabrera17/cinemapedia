import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
//defino como lucen los origenes de datos que pueden traer peliculas
  Future<List<Movie>> getNowPlaying({ int page = 1});

}
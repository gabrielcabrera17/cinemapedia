
//Es abastracta, porque no crearemos instancia de ella
//Será simplemente par que otras clases extiendan de ella

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageDatasource {

  Future<void> toggleFavoriteMovie(Movie movie);


  Future<bool> isFavoriteMovie(int movieId);

  Future<List<Movie>> loadFavoriteMovies({
    int limit = 10,
    int offset = 0
  });


}
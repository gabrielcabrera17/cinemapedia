


import 'package:cinemapedia/config/database/database.dart';
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:drift/drift.dart' as drift;

class DriftDatasource extends LocalStorageDatasource{

  final AppDatabase database;

  DriftDatasource([AppDatabase? databaseToUse])
    : database = databaseToUse ?? db;


  @override
  Future<bool> isFavoriteMovie(int movieId) async {

    //Construir el query
    final query = database.select(database.favoriteMovies)
    //Estos dos puntos(..) me permite regresar a la instancia de db en este caso query
    ..where((tbl) => tbl.movieId.equals(movieId),);
    //Ejecutrar el query
    final favoritesMovies = await query.getSingleOrNull();

    //retornar el resultado
    return favoritesMovies != null;

  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, int offset = 0}) {
    // TODO: implement loadFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await isFavoriteMovie(movie.id);
   
    if(isFavorite){
      final deletequery = database.delete(database.favoriteMovies)
        ..where((tbl) => tbl.movieId.equals(movie.id),);

      await deletequery.go();
      return;
    }

    await database.into(database.favoriteMovies)
    .insert(
      FavoriteMoviesCompanion.insert(
        movieId: movie.id, backdropPath: movie.backdropPath, originalTitle: movie.originalTitle, posterPath: movie.backdropPath, title: movie.title, voteAverage: drift.Value(movie.voteAverage)

      )
    );
  }

}

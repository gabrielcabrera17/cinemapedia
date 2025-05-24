import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier,Map<String, Movie>>((ref) {

  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: movieRepository.getMovieById);

},);

/*
 se creara un mapa en donde se dentra el id de la pelicula
 y apunta a una  instancia de movie
 {
 '505642': Movie(),
 '505643': Movie(),
 '505644': Movie(),
 }
*/

typedef GetMovieCallBack = Future<Movie>Function(String movieId);
class MovieMapNotifier extends StateNotifier<Map<String,Movie>>{

    final GetMovieCallBack getMovie;

    MovieMapNotifier({ required this.getMovie}): super({});

    Future<void> loadMovie(String movieId) async {
        if(state[movieId] != null) return;
        print('Realizando la petición...');
        final movie = await getMovie(movieId);
        //clonamos el estado anterior y añadimos la movieId
        state = { ...state, movieId: movie};
    }
}
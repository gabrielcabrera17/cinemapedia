//clase que me permita la reutilización y únicamente cambiar el caso de uso
//El caso de uso es la forma en como nostros pedimos la información 
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//esta variable lo que hára es proveer de las peliculas actuales en el cine
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
   );
},);


final popularMovieProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getPopular;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
   );
},);

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getTopRated;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
   );
},);

final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getUpcoming;
  
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
   );
},);

typedef MovieCallback = Future<List<Movie>> Function({ int page });

//State_Notifier_Provider: es un proovedor de información que notifica cuando cambia el estado 
class MoviesNotifier extends StateNotifier<List<Movie>>{

  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]);

  Future<void> loadNextPage() async{
    if( isLoading ) return;
    isLoading = true;
    print('loading more movies');
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    //regresar un nuevo estado
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    //cerrando para evitar peticiones simultaneas
    isLoading = false;
  }


}
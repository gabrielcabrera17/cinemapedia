

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// lo que necesito de riverpod para manejar una variable de string
final searchQueryProvider = StateProvider<String>((ref) => '');


final searchMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  
  final movieRepository = ref.read(movieRepositoryProvider);
  
  return SearchedMoviesNotifier(
    ref: ref, 
    searchMovies: movieRepository.searchMovies
  );
},);

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier <List<Movie>> {

  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchedMoviesNotifier({
    required this.ref,
    required this.searchMovies
  }) : super([]);

  Future<List<Movie>> searchMovieByQuery(String query) async {

    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;

    return movies;
  }

}
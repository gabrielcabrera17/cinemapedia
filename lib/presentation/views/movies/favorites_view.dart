import 'package:cinemapedia/presentation/provider/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widget/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoritesView extends ConsumerStatefulWidget {

  const FavoritesView();

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {

  @override
  void initState() {
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    final favoriteMovies = ref.watch(favoriteMoviesProvider);
    final myMovieList = favoriteMovies.values.toList();

    final colorPrimary = Theme.of(context).colorScheme.primary;

    if(myMovieList.isEmpty){
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 100, color: colorPrimary,),
              Text('No hay Peliculas Favoritas', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
            ],
          ),
        )
      );
    }
    return Scaffold(
      body: MovieMasonry(
        movies: myMovieList,
        loadNextPage: () => ref.read(favoriteMoviesProvider.notifier).loadNextPage(),  
      )
    );
  }
}
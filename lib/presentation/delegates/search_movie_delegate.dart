import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
//funciono que mandare llamar para consultar mis peliculas 
typedef SearchMoviesCallback = Future<List<Movie>> Function( String query );
//Especificamos que queremos regresar una Movie
class SearchMovieDelegate extends SearchDelegate<Movie?>{

  final SearchMoviesCallback searchMovies;
  SearchMovieDelegate({
    required this.searchMovies
});


  @override  
  String get searchFieldLabel => 'Buscar Pelicula';
  //build para construir acciones, iconos, etc.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [

      //al presionar el botón se le asigna al query un string vacio
      FadeIn(
        //utilizamos animatedo de fer herrera para hacer desparecer
        // el botón de clear con más estilo
        animate: query.isNotEmpty,
        child: IconButton(onPressed: () => query = '', 
        icon: const Icon(Icons.clear)
        ),
      )

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query), 
      builder: (context, snapshot) {
        
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(title: Text(movie.title));
          },

        );
      },
    );
  }



}
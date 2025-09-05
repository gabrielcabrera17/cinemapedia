import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
//Especificamos que queremos regresar una Movie
class SearchMovieDelegate extends SearchDelegate<Movie?>{
  @override  
  String get searchFieldLabel => 'Buscar Pelicula';
  //build para construir acciones, iconos, etc.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      //if(query.isNotEmpty)
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
    return const Text('buildSuggestions');
  }



}
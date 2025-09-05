import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate{
  @override  
  String get searchFieldLabel => 'Buscar Pelicula';
  //build para construir acciones, iconos, etc.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Text('BuildActions')
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('buildLeading');
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
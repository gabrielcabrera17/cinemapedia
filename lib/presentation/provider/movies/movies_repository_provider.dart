// Este archivo creara la instancia de ese "MovieRepositoryImpl"
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repostitories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutagle, solo de lectura 
final movieRepositoryProvider = Provider((ref)  {
  return MovieRepositoryImpl(MoviedbDatasource());
});
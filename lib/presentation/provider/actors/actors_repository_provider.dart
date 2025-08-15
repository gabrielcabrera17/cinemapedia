
//Este repositorio es inmutagle, solo de lectura 
import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repostitories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref)  {
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});
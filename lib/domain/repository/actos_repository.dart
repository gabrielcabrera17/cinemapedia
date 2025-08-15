import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActosRepository {
  
   Future<List<Actor>>  getActorsByMovie(String movieId);
  
}



import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/provider/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier,Map<String, List<Actor>>>((ref) {

  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);

},);

/*
 se creara un mapa en donde se dentra el id de la pelicula
 y apunta a una lista de actores.
 {
 '505642': <Actor>[],
 '505643': <Actor>[],
 '505644': <Actor>[],
 }
*/

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>>{

    final GetActorsCallback getActors;

    ActorsByMovieNotifier({ required this.getActors}): super({});

    Future<void> loadActor(String movieId) async {
        if(state[movieId] != null) return;
        
        final List<Actor> actors = await getActors(movieId);
        //clonamos el estado anterior y añadimos la movieId
        state = { ...state, movieId: actors};
    }
}
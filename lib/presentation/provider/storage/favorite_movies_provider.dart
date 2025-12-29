/*
Este provider manejara un mapa
{
  1:Movie,
  2:Movie,
  3:Movie
}
*/

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repository/local_storage_repository.dart';
import 'package:cinemapedia/presentation/provider/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider((ref) {
  //Debemos retornar la instancia de un StateNotifierProvider
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
},);


class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>>{

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({ required this.localStorageRepository}): super({});


  Future<void> toggleFavoriteMovie (Movie movie) async{
    //Consultamos si esta en favorito
    final isFavorite = await localStorageRepository.isFavoriteMovie(movie.id);
    print('isFavorite: $isFavorite');
    //Este código nos permite impactar directamente en la base de datos
    await localStorageRepository.toggleFavoriteMovie(movie);
    // si esta, notificar a los listeners que el estado cambió
    if(isFavorite) {
      state.remove(movie.id);
      state = {... state};
      return;
    }

     //si no esta en favoritos la agregamos a nuestro state
    state = {... state, movie.id: movie};

  }

}
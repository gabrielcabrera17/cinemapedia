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
  final LocalStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStorageRepository: LocalStorageRepository);
},);


class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>>{

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({ required this.localStorageRepository}): super({});

}
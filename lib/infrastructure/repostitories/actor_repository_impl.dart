


import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repository/actors_repository.dart';

/*El obejtivos de las implementaciones de repositorio es que
nuestros providers puedan tomar del datasource que yo especifico
los metodos y pueda cambiarlo fácilmente.
Sirve de puente con los gestores de estado y el datasource
*/
class ActorRepositoryImpl extends ActorsRepository{
  //cualquier clase que extienda de ActorsDatasource va a ser permitido
  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
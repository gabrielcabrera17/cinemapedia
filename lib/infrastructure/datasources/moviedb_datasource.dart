
import 'package:cinemapedia/config/constans/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_db_response.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource{

   final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }
    ));


    List<Movie> _jsonToMovies(Map<String,dynamic> json){

    

    //recibimos el json 
    final movieDBResponse = MovieDbResponse.fromJson(json);

    //lo mapeamos 
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDbToEntity(moviedb)
    ).toList();

    
    // y retornamos una lista de peliculas
    return movies;

  }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);

  }

  
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular',
      queryParameters: {
        'page': page
      }
    );
   
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page': page
      }
    );
   
    return _jsonToMovies(response.data);
  }

  @override
Future<Movie> getMovieById(String id) async {
  final response = await dio.get('/movie/$id');
  if( response.statusCode != 200) throw Exception('Movie with id: $id not found');

  final movieDetails = MovieDetails.fromJson(response.data);
  final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

  return movie;
}

}


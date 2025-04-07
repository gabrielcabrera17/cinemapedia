import 'package:cinemapedia/presentation/provider/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_slideshow_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref){

// cualquiera de estos esta vacio, entonces estoy cargando
final step1 = ref.watch( nowPlayingMoviesProvider).isEmpty;
final step2 = ref.watch( moviesSlidesShowProvider).isEmpty;
final step3 = ref.watch( popularMovieProvider).isEmpty;
final step4 = ref.watch( topRatedMoviesProvider).isEmpty;
final step5 = ref.watch( upcomingMoviesProvider).isEmpty;

//hasta que todos tengan un valor, entonces retorno true
if(step1 || step2 || step3 || step4 || step5) return true;
return false;
});
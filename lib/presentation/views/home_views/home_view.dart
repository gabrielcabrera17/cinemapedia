
import 'package:cinemapedia/presentation/provider/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widget/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widget/movies/movies_slideshow.dart';
import 'package:cinemapedia/presentation/widget/shared/custom_app.dart';
import 'package:cinemapedia/presentation/widget/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView();

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    //si hago3 el .notifier no quiero el valor, no quiero el estado quiero el notifier
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMovieProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch( moviesSlidesShowProvider);
    final popularMovies = ref.watch( popularMovieProvider);
    final topRatedMovies = ref.watch( topRatedMoviesProvider);
    final upcomingMovies = ref.watch( upcomingMoviesProvider);

    return CustomScrollView(
      //slivers es un widget que trabaja directamente con el scrollview
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: CustomAppbar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(

                children: [
            
                //const CustomAppbar(),
            
                MoviesSlidesShow(movies: slideShowMovies),
            
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  }
                ),
            
                MovieHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Proximamente',
                  subTitle: 'En este mes',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  }
                ),
            
                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Populares',
                  //subTitle: 'En',
                  loadNextPage: () {
                    ref.read(popularMovieProvider.notifier).loadNextPage();
                  }
                ),
            
                MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Mejor calificadas',
                  subTitle: 'Desde siempres',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  }
                ),

                const SizedBox(height: 10,)
                
            
              ],
            );
          },
          childCount: 1
        ))

      ]
   
    );
  }
}
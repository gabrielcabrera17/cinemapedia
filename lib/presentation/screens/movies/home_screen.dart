import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:cinemapedia/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),

    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    //si hago el .notifier no quiero el valor, no quiero el estado quiero el notifier
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMovieProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
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
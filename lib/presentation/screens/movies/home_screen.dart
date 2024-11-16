import 'package:cinemapedia/presentation/provider/movies/movies_providers.dart';
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

    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    //si hago el .notifier no quiero el valor, no quiero el estado quiero el notifier
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider);
  
    return Column(
      children: [
        
        const CustomAppbar(),

        MoviesSlidesShow(movies: nowPlayingMovies)

      ],
    );
  }
}
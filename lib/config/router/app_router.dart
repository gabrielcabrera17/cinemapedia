import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';
        print('page index $pageIndex');
        return  HomeScreen(pageIndex: int.parse(pageIndex),);
      },
      //rutas hijas
      routes: [
         GoRoute(
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state){
                final movieId = state.pathParameters['id'] ?? 'no-id';
                
                return  MovieScreen(movieId: movieId,);
              }
            )
          ]
        )
      ]
    );
   
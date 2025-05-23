import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  

  Stream<String> getLoadingMessages(){
    final List<String> messages = [
      'Cargando peliculas',
      'Comprando palomitas',
      'Cargando populares',
      'Llamando a mi novia',
      'Ya mero...',
      'Esto esta tardando más de lo esperado :(',
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step){
      return messages[step];
    }).take(messages.length); // con el take cancelo el periodo teniendo encuenta el tamaño del array
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Esére por favor'),
          const SizedBox(height: 10,),
          const CircularProgressIndicator(strokeWidth: 2,),
          const SizedBox(height: 10,),

          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if( !snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!); 
            },
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
     final colors = Theme.of(context).colorScheme;
     final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 0),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.movie_outlined, color: colors.primary,),
              const SizedBox(width: 5,),
              Text('Cinemapedia', style: titleStyle,),

              const Spacer(),

              IconButton(
                onPressed: () {
                  
                }, 
                icon: const Icon(Icons.search)
              )
            ],
          ),
        ),
        )



        
    );
  }
}
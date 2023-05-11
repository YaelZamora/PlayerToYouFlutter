import 'package:flutter/material.dart';
import 'package:player_to_you/tabs/home_tab_views/nuevas_canciones.dart';

class Albumes extends StatefulWidget {
  const Albumes({super.key});

  @override
  State<Albumes> createState() => _AlbumesState();
}

class _AlbumesState extends State<Albumes> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
      ),
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    NetworkImage('https://picsum.photos/id/${index + 10}/175'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 120,
              ),
              Text(
                cancion.keys.elementAt(index),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(cancion.values.elementAt(index)),
            ],
          )
        ],
      ),
    );
  }
}

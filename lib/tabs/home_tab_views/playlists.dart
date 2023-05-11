import 'package:flutter/material.dart';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/id/${index + 10}/175'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          playlists.keys.elementAt(index),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(playlists.values.elementAt(index)),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right_rounded),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        indent: 70,
      ),
    );
  }
}

Map<String, String> playlists = {
  'Mis favoritos': 'Varios',
  'Best Mägo de Oz': 'Mägo de Oz',
  'Relajación': 'Varios',
  'Estudio': 'Varios',
  'Música clásica': 'Varios',
  'Hard Rock': 'Varios',
  'Música de camionero': 'Varios',
  'Cumbias pa bailar': 'Varios',
  'Para limpiar': 'Varios',
  'Para cocinar': 'Varios',
  'Duerme ya': 'Varios',
  '2000 hits': 'Varios',
  'Enamorados': 'Varios',
  'Laura Sad': 'Varios',
  'Hora de tomar': 'Varios',
};

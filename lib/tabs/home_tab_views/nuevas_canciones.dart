import 'package:flutter/material.dart';
import 'package:player_to_you/play_screen.dart';

class NuevasCanciones extends StatefulWidget {
  const NuevasCanciones({super.key});

  @override
  State<NuevasCanciones> createState() => _NuevasCancionesState();
}

class _NuevasCancionesState extends State<NuevasCanciones> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: size.width,
              height: size.height * 0.2,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) => Container(
                  width: 115,
                  height: 115,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://picsum.photos/id/${index + 10}/75',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        cancion.keys.elementAt(index),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cancion.values.elementAt(index),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
          /*Container(
            width: size.width,
            height: size.height * 0.2,
            color: Colors.red,
          ),*/
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Text(
              'Top de la SEMANA',
              style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: Container(
                  width: 75,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/id/${index + 10}/75',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  cancion.keys.elementAt(index),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  cancion.values.elementAt(index),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: SizedBox(
                  width: 96,
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PlayScreen(
                      artista: cancion.values.elementAt(index),
                      song: cancion.keys.elementAt(index),
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, String> cancion = {
  'Que la vida te acompañe': 'Desconocido',
  'Tus ojos mi felicidad': 'Yael Zamora',
  'Me enamoras': 'Desconocido',
  'Lo mejor de mi': 'Aaron Samuels',
  'Recuerda que te amo': 'Roberto Ibarra',
  'El dolor de tu ausencia': 'Major Marjorie',
  'Las lagrimas del mar': 'Desconocido',
  'Recuerda nuestro amor': 'La Autentica',
  'Eres mi todo': 'Yael Zamora',
  'Que el viento sople a tu favor': 'Mägo de Oz',
  'Finisterra': 'Mägo de Oz',
  'La venganza de Gaia': 'Mägo de Oz',
  'El que quiera entender que entienda': 'Mägo de Oz',
  'Hoy toca ser feliz': 'Mägo de Oz',
  'Pensatorium': 'Mägo de Oz',
};

import 'package:flutter/material.dart';
import 'package:player_to_you/tabs/home_tab_views/nuevas_canciones.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://picsum.photos/700',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.2,
              ),
              Container(
                width: size.height * 0.2,
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/200',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text(
                'Yael Zamora',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    WidgetEspecial(
                      icono: Icons.favorite_border,
                      titulo: 'Favoritos',
                    ),
                    WidgetEspecial(
                      icono: Icons.star_border,
                      titulo: 'Destacadas',
                    ),
                    WidgetEspecial(
                      icono: Icons.settings,
                      titulo: 'Configuración',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.5,
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    title: Text(cancion.keys.elementAt(index)),
                    subtitle: Text(cancion.values.elementAt(index)),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_rounded),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WidgetEspecial extends StatelessWidget {
  const WidgetEspecial({
    super.key,
    required this.icono,
    required this.titulo,
  });

  final IconData icono;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icono,
          size: 30,
        ),
        Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'home_tab_views/home_tab_views.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.09,
          color: Colors.blueGrey,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/id/$index/50',
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width,
          height: 44,
          child: TabBar(
            padding: const EdgeInsets.symmetric(vertical: 10),
            isScrollable: true,
            controller: _tabController,
            tabs: const [
              Text(
                'Nuevas canciones',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                'Álbumes',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                'Playlists',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ],
            indicatorWeight: 1,
            indicatorPadding: const EdgeInsets.only(right: 50),
            indicatorColor: Colors.yellow,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.74,
          child: TabBarView(
            controller: _tabController,
            children: const [
              NuevasCanciones(),
              Albumes(),
              Playlists(),
            ],
          ),
        ),
      ],
    );
  }
}

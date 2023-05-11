import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import 'models/audio_model.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({
    super.key,
    required this.artista,
    required this.song,
    required this.index,
  });

  final String artista;
  final String song;
  final int index;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.setAsset('assets/ram-pam-pam.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white70,
                Colors.white60,
                Colors.white54,
                Colors.white38,
                Colors.white30,
                Colors.white24,
                Colors.white12,
                Colors.white10,
                Colors.black12,
                Colors.black26,
                Colors.black38,
                Colors.black45,
                Colors.black54,
                Colors.black87,
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(
                  Icons.headphones_rounded,
                ),
              ),
              IconButton(
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/id/${widget.index + 10}/175',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text(_audioPlayer.position.toString()),
                  const SizedBox(width: 10),
                  AnimatedContainer(
                    height: 3,
                    width: 280,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.blueGrey,
                        ],
                      ),
                    ),
                    duration: const Duration(seconds: 90),
                  ),
                  const SizedBox(height: 10),
                  //Text(_audioPlayer.duration.toString()),
                ],
              ),
              Text(
                widget.song,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                widget.artista,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      _audioPlayer.seek(const Duration(seconds: 5));
                    },
                    icon: const Icon(
                      Icons.fast_rewind_rounded,
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      setState(() {
                        (_audioPlayer.playing)
                            ? _audioPlayer.pause()
                            : _audioPlayer.play();
                      });
                    },
                    icon: Icon(
                      (_audioPlayer.playing)
                          ? Icons.pause
                          : Icons.play_arrow_rounded,
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fast_forward_rounded,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.transparent,
                    builder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.blueGrey,
                      ),
                      child: const LyricsWidget(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  'Lyrics',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LyricsWidget extends StatelessWidget {
  const LyricsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
            label: const Text(
              'Lyrics',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 300,
            width: 500,
            child: ListView.builder(
              itemCount: letra.length,
              itemBuilder: (BuildContext context, int index) => Text(
                letra.elementAt(index),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> letra = [
  'Lelo-lelo-lai',
  'Lelo-lelo-lai',
  'Lelo-lelo-lai',
  'Lelo-lole',
  'What you gonna do?',
  'Si a la relación ya le dio undo',
  'No vuelvo a cometer errores',
  'Y menos con alguien así como',
  'tú(lelo-lole)',
  'Que me trata feo',
  'Ya no me pongo triste si no te',
  'veo',
  'Tú mismo de la buscaste',
  'Ya mi corazón no te ruega, se',
  'volvió ateo (lelo-lole)',
  'Y tengo un novio nuevo que',
  'me hace',
  'Ram-pam-pam-pam-pam',
  'Ram-pam-pam-pam-pam',
];

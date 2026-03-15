import 'package:flutter/material.dart';

import '../../widgets/music/music_cover.dart';
import '../../widgets/music/music_progress.dart';
import '../../widgets/music/music_controls.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back),

                  Text(
                    "PLAYLIST",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  Icon(Icons.menu),
                ],
              ),

              const SizedBox(height: 30),

              /// MUSIC COVER
              const MusicCover(),

              const SizedBox(height: 20),

              /// PROGRESS BAR
              const MusicProgress(),

              const SizedBox(height: 30),

              /// CONTROLS
              const MusicControls(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../domain/models/song_model.dart';

class PlayerView extends StatelessWidget {
  final Song song;
  final bool isPlaying;
  final double progress; // 0.0 to 1.0
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onTogglePlaylist;

  const PlayerView({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.progress,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
    required this.onTogglePlaylist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2E001F), Color(0xFF000000)],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Text(
                  'ALBUM',
                  style: TextStyle(
                    color: Colors.white70,
                    letterSpacing: 4,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 48),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 280,
                  height: 280,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 2,
                    backgroundColor: Colors.white10,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withValues(alpha: 0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF8E0E50),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: onPlayPause,
                      ),
                    ),
                  ),
                ),
                // Indicator dots on the ring
                Positioned(
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            song.title.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            song.artist.toUpperCase(),
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 48),
          // Control Panel
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white54),
                      onPressed: onTogglePlaylist,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.white),
                      onPressed: onPrevious,
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.pink),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.share_outlined, color: Colors.white54),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white),
                      onPressed: onNext,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Slider
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                    activeTrackColor: Colors.pink,
                    inactiveTrackColor: Colors.white12,
                    thumbColor: Colors.pink,
                  ),
                  child: Slider(
                    value: progress,
                    onChanged: (v) {},
                  ),
                ),
                const SizedBox(height: 8),
                const Icon(Icons.keyboard_arrow_down, color: Colors.white24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

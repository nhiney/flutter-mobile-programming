import 'package:flutter/material.dart';
import '../../domain/models/song_model.dart';

class PlaylistView extends StatelessWidget {
  final List<Song> songs;
  final int currentIndex;
  final bool isPlaying;
  final Function(int) onSongSelect;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const PlaylistView({
    super.key,
    required this.songs,
    required this.currentIndex,
    required this.isPlaying,
    required this.onSongSelect,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
  });
  @override
  Widget build(BuildContext context) {
    final currentSong = songs[currentIndex];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
      ),
      child: Column(
        children: [
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white70, size: 20),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      currentSong.title.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 2),
                    ),
                    Text(
                      currentSong.artist.toUpperCase(),
                      style: const TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: Colors.white10,
                  color: Colors.pink,
                  minHeight: 2,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, color: Colors.white, size: 24),
                      onPressed: onPrevious,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF8E0E50),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: onPlayPause,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, color: Colors.white, size: 24),
                      onPressed: onNext,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Playlist
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  final bool isSelected = index == currentIndex;
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${index + 1}.',
                          style: TextStyle(
                            color: isSelected ? Colors.pink : Colors.white38,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.pink : Colors.white12,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(Icons.music_note, color: Colors.white24, size: 20),
                        ),
                      ],
                    ),
                    title: Text(
                      song.title,
                      style: TextStyle(
                        color: isSelected ? Colors.pink : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      song.artist,
                      style: const TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          song.duration,
                          style: const TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.more_vert, color: Colors.white24, size: 20),
                      ],
                    ),
                    onTap: () => onSongSelect(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

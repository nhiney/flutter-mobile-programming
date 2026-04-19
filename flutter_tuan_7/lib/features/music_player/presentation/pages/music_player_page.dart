import 'package:flutter/material.dart';
import '../../domain/models/song_model.dart';
import '../widgets/player_view.dart';
import '../widgets/playlist_view.dart';
import '../../../../core/config/app_config.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isPlaying = false;
  final double _progress = 0.3;

  late final List<Song> _songs;

  @override
  void initState() {
    super.initState();
    final rawList = AppConfig.instance.getObjectList('music_player.songs');
    _songs = rawList.isNotEmpty
        ? rawList
            .map(
              (m) => Song(
                title: m['title'] as String? ?? 'Unknown Title',
                artist: m['artist'] as String? ?? 'Unknown Artist',
                duration: m['duration'] as String? ?? '0:00',
                filePath: 'assets/${m['asset'] as String? ?? ''}',
                albumArt: '',
              ),
            )
            .toList()
        : [
            const Song(
              title: 'Song Title 1',
              artist: 'Artist Name 1',
              duration: '4:20',
              filePath: 'assets/audios/sample1.mp3',
              albumArt: '',
            ),
          ];
  }

  void _onPlayPause() => setState(() => _isPlaying = !_isPlaying);

  void _onNext() => setState(() => _currentIndex = (_currentIndex + 1) % _songs.length);

  void _onPrevious() =>
      setState(() => _currentIndex = (_currentIndex - 1 + _songs.length) % _songs.length);

  void _onSongSelect(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          PlayerView(
            song: _songs[_currentIndex],
            isPlaying: _isPlaying,
            progress: _progress,
            onPlayPause: _onPlayPause,
            onNext: _onNext,
            onPrevious: _onPrevious,
            onTogglePlaylist: () => _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
          ),
          PlaylistView(
            songs: _songs,
            currentIndex: _currentIndex,
            isPlaying: _isPlaying,
            onSongSelect: _onSongSelect,
            onPlayPause: _onPlayPause,
            onNext: _onNext,
            onPrevious: _onPrevious,
          ),
        ],
      ),
    );
  }
}

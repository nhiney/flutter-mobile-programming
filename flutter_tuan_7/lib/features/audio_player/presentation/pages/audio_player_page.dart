import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/audio_controls.dart';
import '../../../../core/config/app_config.dart';

class _SongEntry {
  final String title;
  final String artist;
  final String asset;

  const _SongEntry({
    required this.title,
    required this.artist,
    required this.asset,
  });

  factory _SongEntry.fromMap(Map<String, dynamic> map) {
    return _SongEntry(
      title: map['title'] as String? ?? 'Unknown Title',
      artist: map['artist'] as String? ?? 'Unknown Artist',
      asset: map['asset'] as String? ?? '',
    );
  }
}

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioPlayer _audioPlayer;
  int _currentIndex = 0;
  bool _isPlaying = false;

  late final List<_SongEntry> _songs;

  @override
  void initState() {
    super.initState();

    final rawList = AppConfig.instance.getObjectList('audio_player.songs');
    _songs = rawList.isNotEmpty
        ? rawList.map(_SongEntry.fromMap).toList()
        : const [
            _SongEntry(title: 'Sample Song 1', artist: 'Unknown Artist', asset: 'audios/sample1.mp3'),
            _SongEntry(title: 'Sample Song 2', artist: 'Unknown Artist', asset: 'audios/sample2.mp3'),
            _SongEntry(title: 'Sample Song 3', artist: 'Unknown Artist', asset: 'audios/sample3.mp3'),
          ];

    _audioPlayer = AudioPlayer();

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() => _isPlaying = state == PlayerState.playing);
      }
    });

    _audioPlayer.onPlayerComplete.listen((_) => _nextSong());
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playSong() async {
    if (_songs.isEmpty) return;
    try {
      await _audioPlayer.play(AssetSource(_songs[_currentIndex].asset));
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Audio file not found. Please add .mp3 files to assets/audios/.'),
          ),
        );
      }
    }
  }

  Future<void> _pauseSong() async => _audioPlayer.pause();
  Future<void> _stopSong() async => _audioPlayer.stop();

  void _nextSong() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _songs.length;
    });
    _playSong();
  }

  void _previousSong() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _songs.length) % _songs.length;
    });
    _playSong();
  }

  @override
  Widget build(BuildContext context) {
    final song = _songs.isEmpty
        ? const _SongEntry(title: 'No Songs', artist: '', asset: '')
        : _songs[_currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Simple Audio Player'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(Icons.music_note, size: 100, color: Colors.purple[300]),
              ),
              const SizedBox(height: 40),
              Text(
                song.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                song.artist,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 48),
              AudioControls(
                isPlaying: _isPlaying,
                onPlayPause: _isPlaying ? _pauseSong : _playSong,
                onStop: _stopSong,
                onNext: _nextSong,
                onPrevious: _previousSong,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

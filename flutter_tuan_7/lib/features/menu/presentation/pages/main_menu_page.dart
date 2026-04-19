import 'package:flutter/material.dart';
import '../../../audio_player/presentation/pages/audio_player_page.dart';
import '../../../music_player/presentation/pages/music_player_page.dart';
import '../../../user_management/presentation/pages/user_list_page.dart';
import '../../../video_recorder/presentation/pages/video_recorder_page.dart';
import '../../../../media_picker_home.dart';
import '../../../photo_capture/presentation/pages/photo_capture_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Danh sách Bài tập',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.purple[800],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildExerciseCard(
              context,
              title: 'Bài tập 1',
              subtitle: 'Media Picker App (Image & Video)',
              icon: Icons.perm_media_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MediaPickerHome()),
              ),
            ),
            const SizedBox(height: 16),
            _buildExerciseCard(
              context,
              title: 'Bài tập 2',
              subtitle: 'Photo Capture & Preview',
              icon: Icons.camera_enhance_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhotoCapturePage()),
              ),
            ),
            const SizedBox(height: 16),
            _buildExerciseCard(
              context,
              title: 'Bài tập 3',
              subtitle: 'Video Recorder & Playback',
              icon: Icons.videocam_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VideoRecorderPage()),
              ),
            ),
            const SizedBox(height: 16),
            _buildExerciseCard(
              context,
              title: 'Bài tập 4',
              subtitle: 'Simple Audio Player',
              icon: Icons.audiotrack_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AudioPlayerPage()),
              ),
            ),
            const SizedBox(height: 16),
            _buildExerciseCard(
              context,
              title: 'Bài tập 5',
              subtitle: 'Premium Music Player',
              icon: Icons.play_circle_outline,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MusicPlayerPage()),
              ),
            ),
            const SizedBox(height: 16),
            _buildExerciseCard(
              context,
              title: 'Bài tập 6',
              subtitle: 'Quản lý Tài khoản (SQLite)',
              icon: Icons.person_add_alt_1_outlined,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserListPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.purple.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.purple[700]),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

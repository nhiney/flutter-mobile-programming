import 'package:flutter/material.dart';
import '../data/momo_data.dart';
import '../widgets/momo_item.dart';

class MomoScreen extends StatelessWidget {
  const MomoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFA50064),
        elevation: 0,
        title: const Text('MoMo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Grid Services
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 16, bottom: 0),
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.85,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                  children: services.map((e) {
                    return MomoItem(icon: e.icon, text: e.title);
                  }).toList(),
                ),
              ),

              _title('Sự kiện đang diễn ra'),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              _title('MoMo đề xuất'),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: suggestServices.map((item) {
                    return Expanded(
                      child: MomoItem(icon: item.icon, text: item.title),
                    );
                  }).toList(),
                ),
              ),
              
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 16, height: 4, decoration: BoxDecoration(color: const Color(0xFFD82D8B), borderRadius: BorderRadius.circular(2))),
                  const SizedBox(width: 4),
                  Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle)),
                  const SizedBox(width: 4),
                  Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle)),
                ],
              ),
              const SizedBox(height: 16),

              // Banner 2025
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow.shade100, Colors.yellow.shade300],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.card_giftcard, color: Colors.red, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('2025 nhờ ai mà nở hoa?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 2),
                          Text('Gieo quẻ với AI, tìm quý nhân của bạn', style: TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFD82D8B),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Gieo ngay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              _title('Có thể bạn quan tâm'),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      floatingActionButton: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.pink.shade100.withOpacity(0.5), spreadRadius: 4, blurRadius: 10),
          ]
        ),
        padding: const EdgeInsets.all(4),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFD82D8B),
          onPressed: () {},
          shape: const CircleBorder(),
          elevation: 0,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, color: Colors.white, size: 26),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          elevation: 0,
          color: Colors.white,
          child: SizedBox(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMoMoTab(),
                _buildTabItem(iconData: Icons.card_giftcard, label: 'Ưu đãi', hasDot: true),
                
                // FAB placeholder text
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(height: 24),
                    Text('Quét mọi QR', style: TextStyle(color: Colors.black38, fontSize: 10, fontWeight: FontWeight.w500)),
                  ],
                ),

                _buildTabItem(iconData: Icons.history, label: 'Lịch sử GD'),
                _buildTabItem(iconData: Icons.person_outline, label: 'Tôi'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }

  Widget _buildTabItem({required IconData iconData, required String label, bool hasDot = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Icon(iconData, color: Colors.black38, size: 26),
            if (hasDot)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.black38, fontSize: 10, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildMoMoTab() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD82D8B), width: 1.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text('mo\nmo', style: TextStyle(color: Color(0xFFD82D8B), fontSize: 7, fontWeight: FontWeight.bold, height: 1.1)),
        ),
        const SizedBox(height: 4),
        const Text('MoMo', style: TextStyle(color: Color(0xFFD82D8B), fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

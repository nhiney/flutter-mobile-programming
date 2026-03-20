import 'package:flutter/material.dart';
import '../widgets/gift_card_item.dart';

class MomoGiftScreen extends StatelessWidget {
  const MomoGiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F8), // Subtle light pinkish-grey background
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const GiftHeader(),
            const GiftFilters(),
            const GiftBanners(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: const [
                  GiftCardItem(
                    logoAsset: Icons.movie_creation_outlined,
                    logoColor: Color(0xFFE53935),
                    brandName: 'CGV',
                    title: 'CGV -',
                    subtitle: 'Đồng giá 79K khi mua vé CGV 2D trên M...',
                    date: 'HSD: 28/02/2025',
                    buttonTitle: 'Dùng ngay',
                    buttonType: 'text',
                  ),
                  GiftCardItem(
                    logoAsset: Icons.sim_card_outlined,
                    logoColor: Color(0xFFB0006D),
                    brandName: 'Mua Sim\nchính chủ',
                    title: 'Giảm 100K',
                    subtitle: 'Cho đơn từ 0đ',
                    date: 'HSD: 28/02/2025',
                    buttonTitle: 'Dùng ngay',
                    buttonType: 'text',
                    heartColor: Color(0xFFB0006D),
                  ),
                  GiftCardItem(
                    logoAsset: Icons.account_balance,
                    logoColor: Color(0xFF1E88E5),
                    brandName: 'Ngân hàng\nQuốc Tế VIB',
                    title: 'Tặng 100k',
                    subtitle: 'Khi mở thẻ VIB Online Plus 2in1 (*)',
                    date: 'HSD: 31/03/2025',
                    buttonTitle: 'Dùng ngay',
                    buttonType: 'text',
                    badge: 'Quà hiện vật',
                  ),
                  GiftCardItem(
                    logoAsset: Icons.beach_access,
                    logoColor: Color(0xFF03A9F4),
                    brandName: 'Thanh toán\nBảo hiểm',
                    title: 'Hoàn 15K',
                    subtitle: 'Cho hóa đơn từ 3.000.000đ',
                    date: 'Hết hạn sau 5 ngày',
                    dateColor: Color(0xFFE65100),
                    buttonTitle: 'Dùng ngay',
                    buttonType: 'text',
                  ),
                  GiftCardItem(
                    logoAsset: Icons.directions_car,
                    logoColor: Color(0xFFFF9800),
                    brandName: 'Phí không\ndừng',
                    title: 'Giảm 10K',
                    subtitle: 'Cho đơn từ 100K',
                    date: '',
                    buttonTitle: 'Thu thập',
                    buttonType: 'outlined',
                    topBadge: 'KM đa tầng',
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GiftHeader extends StatelessWidget {
  const GiftHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFCE4EC), Color(0x00FCE4EC)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 1.0],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back, color: Color(0xFF333333), size: 20),
          ),
          const SizedBox(width: 16),
          const Text(
            'Quà của Vinh (7)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF222222)),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
            ),
            child: Row(
              children: [
                const Icon(Icons.headset_mic_outlined, size: 18, color: Color(0xFF333333)),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: 12,
                  width: 1,
                  color: Colors.grey.shade400,
                ),
                const Icon(Icons.close, size: 18, color: Color(0xFF333333)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GiftFilters extends StatelessWidget {
  const GiftFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: const Icon(Icons.filter_alt_outlined, size: 18, color: Color(0xFF555555)),
          ),
          const SizedBox(width: 12),
          const _FilterChip('Sắp xếp', iconRight: Icons.sort), 
          const SizedBox(width: 8),
          const _FilterChip('Dịch vụ', iconRight: Icons.keyboard_arrow_down),
          const SizedBox(width: 8),
          const _FilterChip('Gần tôi'),
          const SizedBox(width: 8),
          const _FilterChip('Yêu thích'),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData? iconRight;

  const _FilterChip(this.label, {this.iconRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: Color(0xFF555555), fontWeight: FontWeight.w500)),
          if (iconRight != null) ...[
            const SizedBox(width: 4),
            Icon(iconRight, size: 16, color: const Color(0xFF555555)),
          ]
        ],
      ),
    );
  }
}

class GiftBanners extends StatelessWidget {
  const GiftBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // Left Banner (Orange)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF6E4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFDAB9), width: 1.5),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFCC80),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFFFB74D), width: 1.5),
                    ),
                    child: const Center(
                      child: Text('m', style: TextStyle(color: Color(0xFFF57C00), fontWeight: FontWeight.w900, fontSize: 18)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Đang có', style: TextStyle(fontSize: 11, color: Color(0xFF757575))),
                        Text('1.955 Xu', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: Color(0xFF333333))),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Color(0xFFF57C00), size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Right Banner (Blue)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E4ECC), Color(0xFF4C7BFF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1565C0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.card_giftcard, color: Color(0xFFFF5252), size: 20),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bỏ túi ngay', style: TextStyle(fontSize: 11, color: Color(0xFFBBDEFB))),
                        Text('4 thẻ quà', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.chevron_right, color: Color(0xFF2E4ECC), size: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

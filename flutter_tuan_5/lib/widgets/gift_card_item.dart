import 'package:flutter/material.dart';

class GiftCardItem extends StatelessWidget {
  final IconData logoAsset;
  final Color logoColor;
  final String brandName;
  final String title;
  final String subtitle;
  final String date;
  final String buttonTitle;
  final String buttonType;
  final Color? heartColor;
  final Color? dateColor;
  final String? badge;
  final String? topBadge;

  const GiftCardItem({
    super.key,
    required this.logoAsset,
    required this.logoColor,
    required this.brandName,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.buttonTitle,
    required this.buttonType,
    this.heartColor,
    this.dateColor,
    this.badge,
    this.topBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Section (Brand)
            SizedBox(
              width: 105,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const SizedBox(height: 12),
                   if (topBadge != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(topBadge!, style: const TextStyle(fontSize: 10, color: Color(0xFFE65100), fontWeight: FontWeight.normal)),
                    ),
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFF0F0F0)),
                    ),
                    child: Icon(logoAsset, color: logoColor, size: 24),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      brandName,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFF333333)),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            
            // Subtle Separator
            Container(
              width: 1,
              margin: const EdgeInsets.symmetric(vertical: 16),
              color: const Color(0xFFF0F0F0),
            ),

            // Right Section (Details)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFF333333))),
                        ),
                        Icon(
                          heartColor == null ? Icons.favorite_border : Icons.favorite, 
                          color: heartColor ?? const Color(0xFF9E9E9E), 
                          size: 20
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(subtitle, style: const TextStyle(fontSize: 13, color: Color(0xFF757575)), maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 6),
                    if (date.isNotEmpty)
                      Text(date, style: TextStyle(fontSize: 11, color: dateColor ?? const Color(0xFF9E9E9E))),
                    
                    const SizedBox(height: 12),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (badge != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(badge!, style: const TextStyle(fontSize: 10, color: Color(0xFF757575), fontWeight: FontWeight.w600)),
                          )
                        else
                          const SizedBox(),
                        
                        if (buttonType == 'text')
                          Text(buttonTitle, style: const TextStyle(color: Color(0xFFA50064), fontWeight: FontWeight.w900, fontSize: 13))
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: const Color(0xFFA50064), width: 1.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(buttonTitle, style: const TextStyle(color: Color(0xFFA50064), fontWeight: FontWeight.w900, fontSize: 13)),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

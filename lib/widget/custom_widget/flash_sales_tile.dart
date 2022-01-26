import 'package:flutter/material.dart';
import 'package:ezcommerce/shared/theme.dart';

class Flashsalestile extends StatelessWidget {
  final String imageUrl;
  const Flashsalestile({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 140,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  image: AssetImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'FS - Nike Air Max 270 React',
              style: blackTextstyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              '\$299,43',
              style: blueTextstyle.copyWith(
                fontSize: 12,
                fontWeight: bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '\$534,33',
                  style: greyTextstyle.copyWith(
                    fontSize: 10,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '24% off',
                  style: redTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

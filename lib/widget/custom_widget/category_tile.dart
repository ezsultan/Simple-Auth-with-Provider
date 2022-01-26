import 'package:ezcommerce/shared/theme.dart';
import 'package:flutter/material.dart';

class CategoryTiles extends StatelessWidget {
  final String text;
  final String imageUrl;
  const CategoryTiles({
    required this.imageUrl,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: greyTextstyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
        )
      ],
    );
  }
}

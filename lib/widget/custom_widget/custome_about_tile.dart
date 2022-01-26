import 'package:ezcommerce/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomAboutTile extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback onTap;
  const CustomAboutTile({
    required this.iconUrl,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iconUrl),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: blackTextstyle.copyWith(
                fontWeight: bold,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: greyColor,
            )
          ],
        ),
      ),
    );
  }
}

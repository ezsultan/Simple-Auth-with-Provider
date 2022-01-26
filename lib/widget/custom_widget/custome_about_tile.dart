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
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 20,
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconUrl,
                  width: 22,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: greyTextstyle.copyWith(
                    fontSize: 12,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: greyColor,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ezcommerce/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomProfileTile extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String information;
  const CustomProfileTile({
    required this.title,
    required this.iconUrl,
    required this.information,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                iconUrl,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          title,
          style: blackTextstyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
          ),
        ),
        const Spacer(),
        Text(
          information,
          style: blackTextstyle.copyWith(
            fontSize: 12,
            fontWeight: light,
          ),
        ),
        const SizedBox(width: 15),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}

import 'package:ezcommerce/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final Function() onPressed;
  final Color color;
  const CustomButton({
    Key? key,
    required this.text,
    this.imageUrl,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: whiteTextstyle.copyWith(
            fontSize: 12,
            fontWeight: bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }
}

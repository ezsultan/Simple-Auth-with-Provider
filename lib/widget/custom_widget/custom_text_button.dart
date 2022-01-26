import 'package:ezcommerce/shared/theme.dart';
import 'package:flutter/widgets.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  const CustomTextButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: blueTextstyle.copyWith(
        fontSize: 12,
        fontWeight: bold,
      ),
    );
  }
}

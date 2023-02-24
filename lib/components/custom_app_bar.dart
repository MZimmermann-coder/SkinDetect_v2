import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../util/colors.dart';
import '../util/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: Icon(
              Icons.arrow_back,
              color: kBlack,
              size: 28,
            ),
          ),
          Text(title, style: kAppbarHeader),
          trailing ?? const SizedBox(width: 28),
        ],
      ),
    );
  }
}

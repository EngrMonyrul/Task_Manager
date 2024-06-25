import 'package:flutter/material.dart';
import 'package:task_manager/utils/extensions/context_ext.dart';

import '../../../utils/constants/assets_const.dart';
import '../../../utils/constants/sizes_const.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    this.image,
    this.title,
    this.subTitle,
  });

  final String? image;
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(
              SizesConsts.defaultRadius,
            ),
          ),
          child: Image.asset(image ?? AssetsConst.icGoogle),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
              top: 2,
              bottom: 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subTitle ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

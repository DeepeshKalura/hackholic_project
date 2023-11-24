import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    this.titleColor = Palette.facebookBlue,
    this.icon,
    this.content,
    this.actionText,
    this.action,
    this.showCancelButton = true,
    this.barrierDismissible = true,
  });

  final Widget title;
  final Color titleColor;
  final Widget? icon, content;
  final String? actionText;
  final Function()? action;
  final bool showCancelButton, barrierDismissible;

  @override
  Widget build(BuildContext context) {
    final actionsStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: titleColor);

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: Row(
        children: [
          icon ?? const SizedBox.shrink(),
          if (icon != null) const SizedBox(width: 8),
          title,
        ],
      ),
      titleTextStyle:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: titleColor),
      content: content,
      actions: [
        if (showCancelButton)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'CANCEL',
              style: actionsStyle.copyWith(color: Palette.grey),
            ),
          ),
        if (actionText != null)
          TextButton(
            onPressed: action,
            child: Text(
              actionText!,
              style: actionsStyle,
            ),
          ),
      ],
    );
  }
}

import 'package:chapa_admin/utils/__utils.dart';
import 'package:flutter/cupertino.dart';

huzzInfoDialog({
  required BuildContext context,
  required Widget dialog,
  VoidCallback? onPressed,
  bool oneButton = true,
}) {
  showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
            content: dialog,
            actions: [
              if (!oneButton)
                CupertinoButton(
                  onPressed: () => context.pop(),
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: AppColors.red),
                  ),
                ),
              CupertinoButton(
                onPressed: onPressed ?? () => context.pop(),
                child: Text(
                  "Ok",
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ));
}

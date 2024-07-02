import 'package:chapa_admin/generated/assets.gen.dart';
import 'package:chapa_admin/utils/__utils.dart';
import 'package:chapa_admin/widgets/image.dart';
import 'package:chapa_admin/widgets/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ErrorW extends StatelessWidget {
  const ErrorW({super.key, this.message, this.onPressed});
  final String? message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LocalSvgIcon(
            Assets.icons.bulk.infoCircle,
            color: AppColors.primary,
            size: 120,
          ),
          Text(message ?? "Something went wrong"),
          20.height,
          if (onPressed != null)
            PrimaryButton(
              onPressed: onPressed,
              label: "Reload",
            )
        ],
      ),
    );
  }
}

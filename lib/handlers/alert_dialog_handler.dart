import 'package:chapa_admin/utils/__utils.dart';
import 'package:chapa_admin/widgets/page_loader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nb_utils/nb_utils.dart';

class AlertDialogHandler {
  static void showAlertDialog(
      BuildContext context, Widget child, bool isLoading,
      {Color? color, String? heading}) {
    showDialog(
        context: context,
        barrierDismissible: isLoading ? false : true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: color ?? Colors.white,
              surfaceTintColor: color ?? Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              content: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 26),
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        30.height,
                        if (heading != null) ...[
                          Text(
                            heading,
                            style: AppStyles.urbanist24Xbd,
                          ),
                        ],
                        20.height,
                        child,
                      ],
                    )),
                  ),
                  Positioned(
                    right: 22,
                    top: 22,
                    child: isLoading
                        ? const PageLoader()
                        : Icon(
                            Icons.cancel,
                            color: Colors.grey.shade500,
                          ).onPop(context),
                  )
                ],
              ),
            );
          });
        });
  }
}

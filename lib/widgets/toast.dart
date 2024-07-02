// import 'package:evolve_user/utils/__utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// void customToast({
//   required BuildContext context,
//   required String message,
//   int? time,
//   required Color backgroundColor,
// }) {
//   final isLongMessage = message.length > 20;
//   FToast().init(context).showToast(
//         positionedToastBuilder: (context, child) =>
//             Positioned(top: 24, child: child),
//         child: Container(
//           width: context.getWidth(isLongMessage ? 0.78.w : 0.42.w),
//           margin: EdgeInsets.only(
//             left: context.getWidth(isLongMessage ? 0.12 : 0.28),
//           ),
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 backgroundColor == Colors.red ||
//                         backgroundColor == AppColors.red
//                     ? Icons.cancel
//                     : Icons.check_circle,
//                 color: Colors.white,
//               ),
//               const Gap(Insets.sm),
//               Flexible(
//                 child: Text(
//                   message,
//                   style: AppStyles.poppins10Md.copyWith(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
// }

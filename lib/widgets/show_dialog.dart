// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:peca_mobile/config/app_icons.dart';
// import 'package:peca_mobile/config/app_themes.dart';
// import 'package:peca_mobile/core/utils/extension.dart';
// import 'package:peca_mobile/widgets/image.dart';

// customDialog({
//   required BuildContext context,
//   required Widget child,
//   String? header,
//   String? subHeader,
// }) async =>
//     await showGeneralDialog<String>(
//         barrierDismissible: true,
//         barrierColor: Colors.transparent,
//         barrierLabel: "",
//         context: context,
//         transitionDuration: const Duration(milliseconds: 400),
//         transitionBuilder: (context, animation, secondaryAnimation, child) {
//           final curvedValue = Curves.easeIn.transform(animation.value) - 1.0;
//           final keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
//           return Transform(
//             transform: Matrix4.translationValues(1, curvedValue * -210, 0.0),
//             child: Align(
//               alignment:
//                   keyboardVisible ? Alignment.center : Alignment.bottomCenter,

//               child: Material(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom),
//                   child: Container(
//                     padding: EdgeInsets.only(
//                       left: Insets.xl.w,
//                       bottom: Insets.l.h,
//                       right: Insets.xl.w,
//                       top: Insets.sm.h,
//                     ),
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(16),
//                           topRight: Radius.circular(16),
//                         ),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, -14),
//                             blurRadius: 14,
//                             color: Color(0x2B143158),
//                             spreadRadius: 1,
//                           )
//                         ]),
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Align(
//                             alignment: Alignment.topCenter,
//                             child: DecoratedBox(
//                               decoration:
//                                   BoxDecoration(color: Colors.grey.shade400),
//                               child: SizedBox(
//                                 width: 34.w,
//                                 height: 5,
//                               ),
//                             ),
//                           ),
//                           Gap(Insets.xl.h),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment:
//                                     subHeader == null || subHeader == ""
//                                         ? MainAxisAlignment.center
//                                         : MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     header ?? "Header Placeholder",
//                                     style: PecaStyles.hb16Rg,
//                                   ),
//                                   const Gap(Insets.xs),
//                                   subHeader == null || subHeader == ""
//                                       ? const SizedBox.shrink()
//                                       : Text(
//                                           subHeader,
//                                           style: PecaStyles.mnt12Md.copyWith(
//                                               color: Color(0xFF7B7B7B)),
//                                         )
//                                 ],
//                               ),
//                               const LocalSvgIcon(AppSvgIcons.cancel)
//                                   .onTap(() => context.pop())
//                             ],
//                           ),
//                           Gap(Insets.md.h),
//                           child
//                         ]),
//                   ),
//                 ),
//               ),
//               //    ),
//             ),
//           );
//         },
//         pageBuilder: (context, animation, secondaryAnimation) {
//           return child;
//         });

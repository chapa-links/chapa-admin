// // import "package:chapa_admin/modules/authentication/provider/auth_provider.dart";
// import "package:chapa_admin/utils/__utils.dart";
// // import "package:country_picker/country_picker.dart";
// import "package:flutter/material.dart";
// import "package:flutter/services.dart";
// import "package:gap/gap.dart";
// import "package:google_fonts/google_fonts.dart";
// import "package:provider/provider.dart";

// class PhoneNumberTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final FocusNode? focusNode;
//   final Function(String input)? onchanged;
//   final String? hintText, labelText;
//   final TextStyle? labelStyle;
//   final bool withBorder;
//   final Color? fillColor;

//   final bool readOnly;
//   final int? maximumLength;

//   const PhoneNumberTextField({
//     super.key,
//     required this.controller,
//     this.focusNode,
//     this.onchanged,
//     this.hintText,
//     this.withBorder = true,
//     this.fillColor,
//     this.labelText,
//     this.labelStyle,
//     this.readOnly = false,
//     this.maximumLength,
//   });

//   @override
//   State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
// }

// class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
//   final formKey = GlobalKey<FormState>();

//   Future showCountryCode(
//       BuildContext context, AuthenticationNotifier notiifier) async {
//     showCountryPicker(
//       context: context,
//       countryListTheme: const CountryListThemeData(
//         flagSize: 25,
//         backgroundColor: Colors.white,
//         bottomSheetHeight: 500, // Optional. Country list modal height
//         //Optional. Sets the border radius for the bottomsheet.
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       // countryFilter: [
//       //   'ZA',
//       //   'KE',
//       //   'GH',
//       //   'NG',
//       //   'RW',
//       //   'TZ',
//       // ],
//       showPhoneCode: true,
//       // optional. Shows phone code before the country name.
//       onSelect: (Country country) {
//         notiifier.countryCode = country.phoneCode;
//         notiifier.countryFlag = country.flagEmoji;

//         country.toJson();

//         setState(() {});
//         print(country.flagEmoji);
//       },
//     );
//   }

//   String? errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     const underlinedInputBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(10),
//         bottomRight: Radius.circular(10),
//       ),
//       borderSide: BorderSide.none,
//     );

//     final underlinedInputErrorBorder = underlinedInputBorder.copyWith(
//       borderSide: underlinedInputBorder.borderSide.copyWith(
//         color: AppColors.error,
//       ),
//     );
//     return Consumer<AuthenticationNotifier>(builder: (_, notifier, __) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 5),
//             height: 58,
//             width: double.maxFinite,
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               border: Border.all(
//                   color: widget.withBorder
//                       ? AppColors.textFieldBorder
//                       : AppColors.white,
//                   width: 1.4),
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     showCountryCode(context, notifier);
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         bottomLeft: Radius.circular(10),
//                       ),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               notifier.countryFlag,
//                               style: const TextStyle(fontSize: 24),
//                             ),
//                             const SizedBox(width: 10),
//                             Text("+${notifier.countryCode}"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextFormField(
//                     key: formKey,
//                     inputFormatters: [PhoneNumberFormatter()],
//                     maxLength: 10,
//                     enabled: true,
//                     controller: widget.controller,
//                     keyboardType: TextInputType.number,
//                     style: GoogleFonts.roboto(
//                       color: Colors.black87,
//                       fontSize: 16,
//                     ),
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     onChanged: widget.onchanged,
//                     textCapitalization: TextCapitalization.none,
//                     decoration: InputDecoration(
//                       counterText: "",
//                       fillColor: AppColors.white,
//                       contentPadding: const EdgeInsets.symmetric(
//                           vertical: 16, horizontal: 28),
//                       focusedErrorBorder: underlinedInputErrorBorder,
//                       enabledBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(10),
//                           bottomRight: Radius.circular(10),
//                         ),
//                         borderSide: BorderSide.none,
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide.none,
//                       ),
//                       errorBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(10),
//                           bottomRight: Radius.circular(10),
//                         ),
//                         borderSide:
//                             BorderSide(width: 0.5, color: AppColors.error),
//                       ),
//                       disabledBorder: const OutlineInputBorder(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(10),
//                           bottomRight: Radius.circular(10),
//                         ),
//                       ),
//                       hintText: widget.hintText ?? "901 733 902",
//                       hintStyle: GoogleFonts.roboto(
//                         color: Colors.black54,
//                         fontSize: 16,
//                       ),
//                       prefixStyle: GoogleFonts.roboto(
//                         color: Colors.black87,
//                         fontSize: 16,
//                       ),
//                     ),
//                     validator: (String? value) {
//                       final receivedValue = value;
//                       const maxLength = 10;
//                       if (receivedValue == null || receivedValue.isEmpty) {
//                         errorMessage = 'Mobile phone number is required';
//                       } else if (receivedValue.length < maxLength) {
//                         errorMessage =
//                             "Mobile phone number cannot be less than $maxLength digits";
//                       } else if (receivedValue.length > maxLength) {
//                         errorMessage =
//                             "Mobile phone number cannot be more than $maxLength digits";
//                       } else {
//                         errorMessage = null;
//                       }
//                       Future.delayed(const Duration(seconds: 1))
//                           .then((_) async {
//                         setState(() {});
//                       });
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//               ],
//             ),
//           ),
//           if (errorMessage != null)
//             Padding(
//               padding: const EdgeInsets.only(left: 16, top: 8),
//               child: Text(
//                 errorMessage ?? "",
//                 style: const TextStyle(
//                   color: AppColors.error,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           const Gap(20),
//         ],
//       );
//     });
//   }
// }

// class PhoneNumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final sanitizedText = newValue.text.replaceAll(RegExp(r'[^\d+]'), '');
//     final hasCountryCode = sanitizedText.startsWith('+');

//     if (sanitizedText.startsWith('0') &&
//         sanitizedText.length > 1 &&
//         !hasCountryCode) {
//       return oldValue;
//     }

//     return newValue.copyWith(
//       text: sanitizedText,
//       selection: TextSelection.collapsed(offset: sanitizedText.length),
//     );
//   }
// }

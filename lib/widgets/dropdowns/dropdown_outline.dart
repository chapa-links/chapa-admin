import 'package:flutter/material.dart';

import '../../../utils/__utils.dart';

const outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide.none,
);

UnderlineInputBorder outlineInputErrorBorder = UnderlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(
    color: AppColors.error,
    width: 0.9,
  ),
);

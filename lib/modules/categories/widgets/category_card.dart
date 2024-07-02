import 'package:chapa_admin/modules/categories/models/categories.dart';
import 'package:chapa_admin/utils/__utils.dart';
import 'package:chapa_admin/widgets/cached_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.data});
  final CategoriesModel data;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: context.getWidth(.6)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedImageWidget(
              imageUrl: data.url,
              height: 40,
              borderRadius: 1,
            ),
            50.width,
            Expanded(child: Text(data.name, style: AppStyles.urbanist14Md)),
            30.width,
            Expanded(child: Text(Utils().formatDate(data.added))),
          ],
        ),
      ),
    );
  }
}

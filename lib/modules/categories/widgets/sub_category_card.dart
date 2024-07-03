import 'package:chapa_admin/modules/categories/models/sub_categories.dart';
import 'package:chapa_admin/utils/__utils.dart';
import 'package:chapa_admin/widgets/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SubCategoryCard extends StatelessWidget {
  const SubCategoryCard({super.key, required this.data, required this.index});
  final SubCategoriesModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: context.getWidth(.6)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: () {
            // context.push(SubCategoriesScreen(categoriesModel: data));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${index + 1}"),
              CachedImageWidget(
                imageUrl: data.images.first,
                height: 40,
                borderRadius: 1,
              ),
              10.width,
              Expanded(child: Text(data.name, style: AppStyles.urbanist14Md)),
              20.width,
              Expanded(child: Text(data.size.first)),
              20.width,
              Expanded(child: Text(data.color.first)),
              20.width,
              Expanded(
                  child: Column(
                children: [
                  Text(data.lower_price),
                  Text(data.higher_price),
                ],
              )),
              20.width,
              Expanded(child: Text(data.design_price)),
              20.width,
              Expanded(child: Text(data.specifications)),
              20.width,
              Expanded(child: Text(Utils().formatDate(data.added))),
            ],
          ),
        ),
      ),
    );
  }
}

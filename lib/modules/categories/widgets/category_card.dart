import 'package:chapa_admin/locator.dart';
import 'package:chapa_admin/modules/categories/models/categories.dart';
import 'package:chapa_admin/modules/categories/screens/sub_categories.dart';
import 'package:chapa_admin/navigation_service.dart';
import 'package:chapa_admin/utils/__utils.dart';
import 'package:chapa_admin/widgets/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.data});
  final CategoriesModel data;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        width: context.getWidth(.4),
        // constraints: BoxConstraints(maxWidth: context.getWidth(.4)),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Shadows.universal,
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            locator<NavigationService>().chapaNavigatorKey.currentState?.push(
                  MaterialPageRoute(
                      builder: (context) =>
                          SubCategoriesScreen(categoriesModel: data)),
                );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedImageWidget(
                imageUrl: data.url,
                height: 40,
                borderRadius: 1,
              ),
              Gap(context.getWidth(.1)),
              Expanded(child: Text(data.name, style: AppStyles.urbanist14Md)),
              30.width,
              Expanded(child: Text(Utils().formatDate(data.added))),
            ],
          ),
        ),
      ),
    );
  }
}

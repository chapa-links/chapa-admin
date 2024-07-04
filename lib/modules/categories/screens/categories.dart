import 'package:chapa_admin/generated/assets.gen.dart';
import 'package:chapa_admin/modules/categories/models/categories.dart';
import 'package:chapa_admin/modules/categories/screens/add_category_screen.dart';
import 'package:chapa_admin/modules/categories/widgets/category_card.dart';
import 'package:chapa_admin/utils/__utils.dart';
import 'package:chapa_admin/utils/app_collections.dart';
import 'package:chapa_admin/widgets/image.dart';
import 'package:chapa_admin/widgets/page_loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final searchController = TextEditingController();
  String searchText = '';

  Stream<QuerySnapshot> get _database {
    CollectionReference storesRef =
        _firebaseFirestore.collection(AppCollections.categories);

    Query query = storesRef;

    return query.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddCategoryScreen()));
        },
        label: const Text("Add New Category"),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            Text('All Categories',
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            30.height,
            StreamBuilder(
              stream: _database,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: PageLoader());
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LocalSvgIcon(
                          Assets.icons.bulk.searchStatus1,
                          size: 100,
                        ),
                        const Text("No categories to show"),
                      ],
                    ),
                  );
                } else {
                  final List<QueryDocumentSnapshot> documents =
                      snapshot.data!.docs;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: context.getWidth(.4)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Image", style: AppStyles.urbanist16Md),
                            Gap(context.getWidth(.1)),
                            Expanded(
                                child: Text("Category Name",
                                    style: AppStyles.urbanist16Md)),
                            30.width,
                            Expanded(
                                child: Text("Date Added",
                                    style: AppStyles.urbanist16Md)),
                          ],
                        ),
                      ),
                      const Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: documents.length,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index) {
                          final data =
                              documents[index].data() as Map<String, dynamic>;
                          final category = CategoriesModel.fromJson(data);
                          return CategoryCard(
                            data: category,
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

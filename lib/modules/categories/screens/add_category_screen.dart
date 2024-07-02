import 'dart:io';

import 'package:chapa_admin/handlers/snackbar.dart';
import 'package:chapa_admin/modules/categories/service/category_service.dart';
import 'package:chapa_admin/utils/app_themes.dart';
import 'package:chapa_admin/widgets/input_fields/text_field.dart';
import 'package:chapa_admin/widgets/page_loader.dart';
import 'package:chapa_admin/widgets/primary_btn.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryNameController = TextEditingController();
  bool _isLoading = false;

  String selectedFile = '';

  Uint8List? image;
  File? imageXFile;

  void _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFile = result.files.first.name;
        image = result.files.first.bytes;
        imageXFile = File(result.files.first.path!);
      });
      setState(() {});
    }
  }

  Future<void> _addCategory(
      BuildContext context, CategoryService categoryService) async {
    if (_formKey.currentState!.validate() && image != null) {
      setState(() {
        _isLoading = true;
      });

      try {
        String imageUrl =
            await categoryService.uploadImage(image!, selectedFile);
        await categoryService.addCategory(
            _categoryNameController.text, imageUrl);

        setState(() => _isLoading = false);
        Future.delayed(Duration.zero, () {
          SnackbarHandler.showSuccessSnackbar(
              context: context, message: 'Category added successfully!');
          Navigator.pop(context);
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        Future.delayed(Duration.zero, () {
          SnackbarHandler.showErrorSnackbar(
              context: context, message: 'Failed to add category: $e');
        });
      }
    } else {
      SnackbarHandler.showErrorSnackbar(
          context: context, message: 'Please enter a name and pick an image');
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Category'),
      ),
      body: Center(
        child: _isLoading
            ? const PageLoader()
            : IntrinsicHeight(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .4,
                    // maxHeight: MediaQuery.of(context).size.width * .3,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: Shadows.universal,
                      borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(22.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Category",
                          style: AppStyles.urbanist24Xbd,
                        ),
                        30.height,
                        CustomTextField(
                          controller: _categoryNameController,
                          labelText: 'Category Name',
                          hintText: 'Enter Category Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a category name';
                            }
                            return null;
                          },
                        ),
                        20.height,
                        if (image != null)
                          SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.memory(
                                  image!,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                Text(selectedFile)
                              ],
                            ),
                          ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => _selectFile(),
                          child: const Text('Select Icon'),
                        ),
                        const SizedBox(height: 20),
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : PrimaryButton(
                                onPressed: () =>
                                    _addCategory(context, categoryService),
                                label: 'Add Category',
                              ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

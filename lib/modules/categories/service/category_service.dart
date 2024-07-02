import 'dart:typed_data';
import 'package:chapa_admin/utils/app_collections.dart';
import 'package:chapa_admin/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // String _imageUrl = "";
  // String get imageUrl => _imageUrl;
  // Future<String> uploadFile({required File imageXFile}) async {
  //   try {
  //     String cloudinary = "https://api.cloudinary.com/v1_1/dhayhxgpw/upload";
  //     // setLoading = true;
  //     final url = Uri.parse(cloudinary);

  //     final request = http.MultipartRequest('POST', url)
  //       ..fields['upload_preset'] = "ea2mci0p"
  //       ..files.add(await http.MultipartFile.fromPath('file', imageXFile.path));
  //     final res = await request.send();
  //     if (res.statusCode == 200) {
  //       final resData = await res.stream.toBytes();
  //       final resString = String.fromCharCodes(resData);
  //       final jsonMap = jsonDecode(resString);
  //       _imageUrl = jsonMap["url"];
  //       // notifyListeners();

  //       return _imageUrl;
  //     } else {
  //       // handleError(message: "failed");
  //       return "";
  //     }
  //   } catch (e, s) {
  //     // handleError(message: e.toString());
  //     print(e);
  //     print(s);
  //     return "";
  //   }
  // }

  Future<String> uploadImage(Uint8List imageFile, String fileNames) async {
    try {
      // String fileName = 'categories/$fileNames';
      Reference storageReference = _storage
          .ref()
          .child("Uploads")
          .child("Categories")
          .child('/$fileNames');
      final metaData = SettableMetadata(
        contentType: 'image/jpeg',
      );
      UploadTask uploadTask = storageReference.putData(imageFile, metaData);
      await uploadTask.whenComplete(() => null);
      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  Future<void> addCategory(String name, String imageUrl) async {
    try {
      final docId = Utils.generateRandomDocIDs();
      final now = Utils.getTimestamp();
      await _firestore.collection(AppCollections.categories).doc(docId).set({
        'id': docId,
        'name': name,
        'imageUrl': imageUrl,
        'added': now,
      });
    } catch (e) {
      throw Exception('Failed to add category: $e');
    }
  }
}

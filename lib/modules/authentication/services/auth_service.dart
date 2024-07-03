import 'package:chapa_admin/handlers/base_change_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends BaseChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      setLoading = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      handleSuccess();
      return true;
    } on FirebaseAuthException catch (e) {
      handleError(message: e.toString());
      return false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> checkAdmin() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection('ADMINS').doc(user.uid).get();
      if (snapshot.exists && snapshot['suspended'] == false) {
        return true;
      }
    }
    return false;
  }
}

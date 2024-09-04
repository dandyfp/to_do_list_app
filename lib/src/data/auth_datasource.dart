import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/src/models/user_model.dart';

class AuthDataSource {
  String? getInLoggedUser() => FirebaseAuth.instance.currentUser?.uid;

  Future<Either<String, String>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    var userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    late DocumentSnapshot<Map<String, dynamic>> resultGetUser;
    if (userCredential.user?.uid != null) {
      CollectionReference<Map<String, dynamic>> users =
          FirebaseFirestore.instance.collection("Users");
      await users.doc(userCredential.user?.uid).set({
        'uid': userCredential.user?.uid,
        'name': name,
        'email': email,
        'password': password,
      });

      DocumentSnapshot<Map<String, dynamic>> result =
          await users.doc(userCredential.user?.uid).get();
      resultGetUser = result;
    }

    if (resultGetUser.exists) {
      return right('Register success');
    } else {
      return left('login failed');
    }
  }

  Future<Either<String, String>> login(
      {required String email, required String password}) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(result.user?.uid ?? '');
    } on FirebaseAuthException catch (e) {
      return left(e.message ?? '');
    }
  }

  Future<Either<String, UserModel>> getUser(String uid) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.doc('Users/$uid');

    DocumentSnapshot<Map<String, dynamic>> result =
        await documentReference.get();
    if (result.exists) {
      return right(UserModel.fromJson(result.data()!));
    } else {
      return left("Failed to get user");
    }
  }
}

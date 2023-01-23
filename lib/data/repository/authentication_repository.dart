import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app_flutter/configs/dependency_injection/dependency_injection.dart';
import 'package:todo_app_flutter/constants/app_string.dart';
import 'package:todo_app_flutter/constants/db_keys.dart';
import 'package:todo_app_flutter/data/models/auth_model/login_model.dart';
import 'package:todo_app_flutter/data/models/auth_model/sign_up_model.dart';
import 'package:todo_app_flutter/data/models/user_model/user_model.dart';
import 'package:todo_app_flutter/data/preferences/app_preference.dart';

class AuthenticationRepository {
  final Dio _dio = getIt.get<Dio>();
  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final AppPreference _appPreference = getIt.get<AppPreference>();

  Future<Either<String, void>> signUp(
    SignUpModel signUpModel,
  ) async {
    try {
      final response = await _firebase.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );
      if (response.user != null) {
        //TODO: Deep Linking for url field, and open our app.
        await _firebase.sendSignInLinkToEmail(
          email: signUpModel.email,
          actionCodeSettings: ActionCodeSettings(
            // url: 'todo-app-flutter-firebas-d71aa.firebaseapp.com',
            url: 'https://www.gmail.com',
            handleCodeInApp: true,
          ),
        );
        final CollectionReference userCollection =
            _firestore.collection(DbKeys.users);
        await userCollection.doc(response.user!.uid).set(
          {
            DbKeys.fullName: signUpModel.fullName,
            DbKeys.dob: signUpModel.dob,
          },
        );
      }
      return right(null);
    } on FirebaseException catch (e) {
      return left(
        e.message.toString(),
      );
    }
  }

  Future<Either<String, void>> loginWithEmail(LoginModel loginModel) async {
    try {
      final response = await _firebase.signInWithEmailAndPassword(
          email: loginModel.email, password: loginModel.password);
      if (response.user != null) {
        final CollectionReference userCollection =
            _firestore.collection(DbKeys.users);
        final userCollectionData =
            await userCollection.doc(response.user!.uid).get();
        UserModel userModel = UserModel(
          fullName: userCollectionData[DbKeys.fullName],
          uid: response.user!.uid,
          email: response.user!.email!,
          dob: userCollectionData[DbKeys.dob].toDate(),
          accessToken: await response.user!.getIdToken(),
          isVerified: response.user!.emailVerified,
        );
        await setUserData(userModel);
        return right(null);
      } else {
        return left(AppString.couldNotProcess);
      }
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    }
  }

  UserModel? getUserData() {
    return _appPreference.getUser();
  }

  Future<bool> setUserData(UserModel userModel) async {
    try {
      await _appPreference.saveUserData(userModel);
      return true;
    } catch (e) {
      print("Saving user data error: $e");
      return false;
    }
  }

  Future<void> setIsUserOnBoarded() async {
    await _appPreference.setUserOnBoardedStatus();
  }

  bool getIsUserOnBoarded() {
    return _appPreference.getUserOnBoardedStatus();
  }
}

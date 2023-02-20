import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
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
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      CalendarApi.calendarScope,
    ],
  );

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
        sendAdditionalUserData(
          fullName: signUpModel.fullName,
          dob: signUpModel.dob,
          uid: response.user!.uid,
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

  UserModel getUserData() {
    return _appPreference.getUser() ?? UserModel.empty();
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

  Future<void> logout() async {
    await _firebase.signOut();
    await _googleSignIn.signOut();
    await _appPreference.clearAllData();
  }

  Future<Either<String, void>> signUpWithGoogle() async {
    try {
      //Making Sure that we SignOut the user first
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final response = await _googleSignIn.authenticatedClient();
      print("#################  $response");

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // Once signed in, return the UserCredential
        final response = await _firebase.signInWithCredential(credential);
        if (response.user != null) {
          await sendAdditionalUserData(
            fullName: googleUser.displayName ?? "",
            uid: response.user!.uid,
          );

          await setUserData(
            UserModel(
              fullName: googleUser.displayName!,
              uid: response.user!.uid,
              email: response.user!.email!,
              dob: DateTime.now(),
              accessToken: googleAuth.accessToken!,
              isVerified: response.user!.emailVerified,
              profilePicture: googleUser.photoUrl,
            ),
          );
          return right(null);
        } else {
          return left(
            AppString.couldNotProcess,
          );
        }
      } else {
        return left(
          AppString.signUpCancelled,
        );
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<void> sendAdditionalUserData({
    required String fullName,
    DateTime? dob,
    required String uid,
  }) async {
    try {
      final CollectionReference userCollection =
          _firestore.collection(DbKeys.users);
      await userCollection.doc(uid).set(
        {
          DbKeys.fullName: fullName,
          DbKeys.dob: dob,
          DbKeys.profilePicture: "", //Sending empty profile picture
        },
      );
    } on FirebaseException {
      throw FirebaseException(plugin: 'Google sign in');
    }
  }

  Future<AuthClient?> authenticateClient() async {
    await _googleSignIn.signIn();
    return await _googleSignIn.authenticatedClient();
  }
}

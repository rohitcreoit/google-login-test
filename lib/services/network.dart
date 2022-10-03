import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/services/model.dart';
import 'package:firebasetest/utils/exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
GoogleAuthProvider googleProvider = GoogleAuthProvider();

loginWithGoogle() async {
  try {
    if (!kIsWeb) {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential? userCreds =
          await firebaseAuth.signInWithCredential(credential);
      socialSignup(userCreds);
    } else {
      UserCredential? userCreds =
          await firebaseAuth.signInWithPopup(googleProvider);
      socialSignup(userCreds);
    }
  } on FirebaseAuthException catch (error) {
    var errorMessage;
    errorMessage = exceptionCase(error, errorMessage);
  }
}

void socialSignup(UserCredential userCreds) async {
  String? idToken = await userCreds.user?.getIdToken();
  print("IdToken: $idToken");
  Resource res = await socialSignUp(UserLoginSignup(idToken: idToken));
  if (res is Success<UserLoginSignup>) {
    await firebaseAuth.signOut();

    if (res.data.preferredCityData != null &&
        res.data.preferredCityData?.name != null) {
      print(res.data);
    }

    Get.defaultDialog(
        title: "Login Success",
        content: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("User Has Been Logged in"),
        ),
        onConfirm: () {
          Get.back();
        },);
  } else if (res is Failure) {
    print("Login Failed");
    print(res.errorMessage.toString());
    print(res.error?.stackTrace?.toString() ?? "");
    print(res.exception?.toString() ?? "");
    Get.defaultDialog(
        title: "Login Failed",
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(res.errorMessage.toString() ??
              res.error?.stackTrace?.toString() ??
              res.exception?.toString() ??
              ""),
        ),
        onConfirm: () {
          Get.back();
        },
        contentPadding: const EdgeInsets.all(8));
  }
}

Future<Resource> socialSignUp(UserLoginSignup data) async {
  try {
    var client = http.Client();
    http.Response response = await client.post(
        Uri.parse("https://urbanaut.app/api/v2_1/user/social/sign-in/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
          // Required for CORS support to work
          "Access-Control-Allow-Credentials": "true",
          // Required for cookies, authorization headers with HTTPS
          "Access-Control-Allow-Headers":
              "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
        body: json.encode(data.toJson()));
    print("response: $response");
    response.headers["content-type"] = 'application/json; charset=utf-8';
    if (response.statusCode < 300) {
      return Success<UserLoginSignup>(
          UserLoginSignup.fromJson(jsonDecode(response.body)));
    } else {
      return Failure(errorMessage: response.body);
    }
  } on Exception catch (e) {
    print(e);
    return Failure(exception: e);
  } on Error catch (e) {
    print(e.stackTrace);
    return Failure(error: e);
  }
}

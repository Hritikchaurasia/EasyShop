import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repositories/cloud_functions.dart';
import '../utils/storage.dart';

class AuthController extends GetxController {
  //obx variables
  var errorText = ''.obs;
  var isVerified = false.obs;
  var isLoading = false.obs;

  //text controllers
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController usernameController;

  // firebase instance
  static final firebaseInstance = FirebaseAuth.instance;

  //init
  @override
  void onInit() {
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
  }

  //singin or login function
  Future<bool> signIn() async {
    isLoading.value = true;
    if (GetUtils.isEmail(emailController.text) &&
        passwordController.text.length > 0) {
      try {
        UserCredential userCredential =
            await firebaseInstance.signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        await Storage().setLoginValue();
        await Storage().setUid(userCredential.user.uid);
        // await firebaseInstance.currentUser.sendEmailVerification();
        // await firebaseInstance.currentUser.reload();
        isLoading.value = false;

        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          errorText.value = 'No user found for that email.';
          print('No user found for that email.');
          isLoading.value = false;
          return false;
        } else if (e.code == 'wrong-password') {
          errorText.value = 'Wrong password provided for that user.';
          print('Wrong password provided for that user.');
          isLoading.value = false;
          return false;
        }
      } on Exception catch (e) {
        errorText.value = 'No user found for that email.';
        print('No user found for that email. $e');
        isLoading.value = false;
        return false;
      } catch (e) {
        errorText.value = 'No user found for that email.';
        print('No user found for that email.');
        isLoading.value = false;
        return false;
      }
    }

    errorText.value = 'Please enter valid email and password';
    isLoading.value = false;
    return false;
  }

  //signup function
  Future<bool> signUp() async {
    isLoading.value = true;
    if (GetUtils.isEmail(emailController.text) &&
        passwordController.text.length > 0) {
      try {
        UserCredential userCredential =
            await firebaseInstance.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        await CloudFunctions().registerUser(userCredential.user.uid,
            emailController.value.text, usernameController.value.text);
        await Storage().setLoginValue();
        await Storage().setUid(userCredential.user.uid);
        // await firebaseInstance.currentUser.sendEmailVerification();
        // await firebaseInstance.currentUser.reload();
        isLoading.value = false;

        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          errorText.value = 'The password provided is too weak.';
          print('The password provided is too weak.');
          isLoading.value = false;
          return false;
        } else if (e.code == 'email-already-in-use') {
          errorText.value = 'The account exists for the email.';
          print('The account already exists for that email.');
          isLoading.value = false;
          return false;
        }
      } on Exception catch (e) {
        errorText.value = 'Unable to create user';
        print('No user found for that email. $e');
        isLoading.value = false;
        return false;
      } catch (e) {
        errorText.value = 'No user found for that email.';
        print('No user found for that email.');
        isLoading.value = false;
        return false;
      }
    }
    errorText.value = 'Please enter valid email and password';
    isLoading.value = false;
    return false;
  }

  //verify user-email
  Future<void> verifyUser() async {
    await firebaseInstance.currentUser.reload();
    if (firebaseInstance.currentUser.emailVerified) {
      isVerified.value = true;
    }
  }

  //forgot password

  //on close
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

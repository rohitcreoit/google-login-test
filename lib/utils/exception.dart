
import 'package:firebase_auth/firebase_auth.dart';

exceptionCase(FirebaseAuthException error, errorMessage) {
  switch (error.code) {
    case "ERROR_INVALID_EMAIL":
      errorMessage = "Your email address appears to be malformed.";
      break;
    case "ERROR_WRONG_PASSWORD":
      errorMessage = "Your password is wrong.";
      break;
    case "ERROR_USER_NOT_FOUND":
      errorMessage = "User with this email doesn't exist.";
      break;
    case "ERROR_USER_DISABLED":
      errorMessage = "User with this email has been disabled.";
      break;
    case "ERROR_TOO_MANY_REQUESTS":
      errorMessage = "Too many requests. Try again later.";
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
      errorMessage = "Signing in with Email and Password is not enabled.";
      break;
    case "EMAIL-ALREADY-IN-USE":
      errorMessage = "Signing in with Email and Password is not enabled.";
      break;
    default:
      errorMessage = "An undefined Error happened.";
  }
  return errorMessage;
}
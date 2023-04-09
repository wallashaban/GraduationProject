import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
 Future<String> signInWithGoogle() async {
    GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    return  gAuth.accessToken!;
    /* final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    debugPrint('oauthToken ${credential.accessToken}');
    debugPrint('++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    gUser = await GoogleSignIn().signOut(); */
  }

  void signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
        //permissions: ['email', 'public_profile'],
        );
    String? accessToken = result.accessToken!.token;
    debugPrint('accessToken -------$accessToken');
    final userData = await FacebookAuth.instance
        .getUserData(fields: 'id,name,email,picture');
    debugPrint('userData $userData');
    await FacebookAuth.instance.logOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptask/constants/string_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutterapptask/providers/app_provider.dart';
import 'package:flutterapptask/screens/home_page_screen.dart';
import 'package:flutterapptask/screens/login_screen.dart';
import 'package:flutterapptask/screens/otp_screen.dart';
import 'package:flutterapptask/services/navigation_services.dart';

class LoginProvider with ChangeNotifier {
  late AppProvider appProvider;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController mobilenum = TextEditingController();
  TextEditingController loginotp = TextEditingController();
  late String verificationId;
  bool codeSent = false;
  bool loggingOut = false;
  bool isAdmin = false;

  User? _user;

  void loginNavigation(context, User? user) async {}

  void SendOTP(BuildContext context) async {
    if (mobilenum.text.length > 9) {
      // NavigationServices.replaceScreen(context, OTPScreen());
    } else {
      Fluttertoast.showToast(msg: Stringconstraints.error_login_entermobilenum);
    }
    // appProvider = Provider.of<AppProvider>(context, listen: false);
    // notifyListeners();
    // await _auth.verifyPhoneNumber(
    //   phoneNumber: '+91' + mobilenum.text.trim(),
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await _auth.signInWithCredential(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     print('$e');
    //     codeSent = false;
    //     notifyListeners();

    //     if (e.code == 'invalid-phone-number') {}
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) async {},
    //   codeSent: (String verificationId, int? resendToken) async {
    //     mobilenum.clear();

    //     codeSent = true;
    //     this.verificationId = verificationId;
    //     NavigationServices.replaceScreen(context, OTPScreen());
    //     //NavigationServices.changeScreen(context, HomePageScreen());
    //   },
    // );
  }

  User? get user => _user;

  LoginOTPVerify(context) async {
    //   notifyListeners();
    //   appProvider = Provider.of<AppProvider>(context, listen: false);
    //   try {
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //       verificationId: verificationId,
    //       smsCode: loginotp.text.trim(),
    //     );

    //     UserCredential userCred = await _auth.signInWithCredential(credential);

    //     if (userCred.user != null) {
    //       codeSent = false;

    //       NavigationServices.replaceScreen(context, const HomePageScreen());
    //     } else {
    //       codeSent = false;
    //       notifyListeners();
    //     }
    //   } catch (e) {
    //     codeSent = false;
    //     notifyListeners();
    //   }
    // }

    if (loginotp.text.length > 3) {
      NavigationServices.replaceScreen(context, const HomePageScreen());
    } else {
      Fluttertoast.showToast(msg: Stringconstraints.error_login_enterpassword);
    }
  }
}

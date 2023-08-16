import 'package:firebase_auth/firebase_auth.dart';

class firebaseAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  //create user
  Future<void> create_user({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCred.user!.updateDisplayName(name);
      print("register success.");
    } catch (e) {
      throw Exception("Error  :  $e");
    }
  }

//update phoneNumber
  updatePhoneNumber({
    required UserCredential userCred,
    required String phone,
  }) async {
    await userCred.user!.updatePhoneNumber(
      PhoneAuthProvider.credential(
        verificationId: "",
        smsCode: phone.trim(),
      ),
    );
  }

  //login user
  Future<void> loginUser(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //get current user
  Map<String, dynamic> getCurrentUser() {
    Map<String, dynamic> userMap = {};
    final user = auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      final name = user.displayName;
      final email = user.email;
      final phone = user.phoneNumber;

      final photo = user.photoURL;
      userMap = {
        "id": uid,
        "name": name,
        "email": email,
        "phone": phone,
        "photo": photo,
      };
    }
    return userMap;
  }

  //signout user
  sighOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

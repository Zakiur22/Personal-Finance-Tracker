import 'package:firebase_auth/firebase_auth.dart';
import 'package:thrifty/models/models.dart' as models;
import 'package:thrifty/services/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'https://www.googleapis.com/auth/plus.me',
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile',
  ]);

  Future<models.User?> get getUser async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;
    return models.User.fromFirebaseUser(firebaseUser);
  }

  Stream<models.User> get user =>
      _auth.authStateChanges().map((firebaseUser) => models.User.fromFirebaseUser(firebaseUser));

  Future<models.User> signInWithGoogle() async {
    try {
      final credential = await getGoogleAuthCredential();
      final authResult = await _auth.signInWithCredential(credential);
      final user = await mapUserFromFirebaseUser(authResult);
      return user;
    } catch (e) {
      print(e.toString());
      throw Exception('Something went horribly wrong, please try again later!');
    }
  }

  Future<AuthCredential> getGoogleAuthCredential() async {
    final googleAccount = await _googleSignIn.signIn();
    if (googleAccount == null) throw Exception('Sign in aborted');
    final googleAuthentication = await googleAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuthentication.idToken,
      accessToken: googleAuthentication.accessToken,
    );
    return credential;
  }

  Future<models.User> signInAnonymously() async {
    try {
      final authResult = await _auth.signInAnonymously();
      final user = await mapUserFromFirebaseUser(authResult);
      return user;
    } catch (e) {
      print(e.toString());
      throw Exception('Something went horribly wrong, please try again later!');
    }
  }

  Future<models.User> mapUserFromFirebaseUser(UserCredential authResult) async {
    final firebaseUser = authResult.user;
    if (firebaseUser == null) throw Exception('Firebase user is null');
    final user = models.User.fromFirebaseUser(firebaseUser);
    try {
      if (!(await UserDatabaseService(user).checkIfUserExists)) {
        UserDatabaseService(user).createUser();
      }
    } catch (_) {}
    return user;
  }

  Future signOut() async {
    try {
      await _googleSignIn.signOut();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      throw Exception('Something went horribly wrong, please try again later!');
    }
  }

  Future deleteUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) throw Exception('No user signed in');
    User targetUser = firebaseUser;
    if (targetUser.providerData.isEmpty || targetUser.providerData.first.providerId != 'firebase') {
      final credential = await getGoogleAuthCredential();
      final authResult = await _auth.signInWithCredential(credential);
      targetUser = authResult.user!;
    }
    await targetUser.delete();
    signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //fonction de connection avec Google

  Future <UserCredential> signInWithGoogle() async{
    //Délencher le flux d'authentification
    final googleUser = await _googleSignIn.signIn();

    //obtenir les details d'autorisation de la demande
    final googleAuth = await googleUser!.authentication;

    //creer un nouvelle identifiant
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    // une fois connecté, renvoyez l'identifiant de l'utilisateur

    return await _auth.signInWithCredential(credential);

    //fonction qui va nous permettre d'avoir l'état de l'utilisateur en temps reel
  }
    Stream<User?> get user =>_auth.authStateChanges();

    //deconnexion

    Future<void> signOut() async{
      await _googleSignIn.signOut(); //se deconnecte du provider google
      await _auth.signOut();
    }
}
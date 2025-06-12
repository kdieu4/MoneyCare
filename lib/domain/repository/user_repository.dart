import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_care/domain/entity/my_user_info.dart';

abstract class UserRepository {
  Stream<User?>? getCurrUser();

  Future<UserCredential> createEmailAndPassword(MyUserInfo userInfo);

  Future<UserCredential> signEmailAndPassword(MyUserInfo userInfo);

  Future<UserCredential> signInWithGoogle();

  Future<void> signOut();
}

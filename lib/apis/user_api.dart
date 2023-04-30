import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_twitter_clone/constants/appwrite_constants.dart';
import 'package:flutter_twitter_clone/core/core.dart';
import 'package:flutter_twitter_clone/core/providers.dart';
import 'package:flutter_twitter_clone/models/user.dart';
import 'package:fpdart/fpdart.dart';

final userAPIProvider = Provider((ref) {
  final db = ref.watch(appwriteDatabaseProvider);
  return UserAPI(db: db);
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUserAPI {
  final Databases _db;

  UserAPI({required Databases db}) : _db = db;
  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.userCollections,
        documentId: ID.unique(),
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(Failure(e.message ?? 'Unexpected error occurred', st));
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}

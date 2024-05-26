import 'package:cloud_firestore/cloud_firestore.dart';

/// {@template firestore_favorites_api}
/// Save and retrieve favorited games with the help of Firebase Firestore
/// {@endtemplate}
class FirestoreFavoritesApi {
  /// {@macro firestore_favorites_api}
  FirestoreFavoritesApi();

  final _db = FirebaseFirestore.instance;

  /// Save a game as a favorite
  /// Needs the [userId] and the [gameId] to save the game
  Future<void> saveFavorite(String userId, String gameId) async {
    // Reference to the user's favorites sub-collection
    final favoritesRef =
        _db.collection('users').doc(userId).collection('favorites').doc(gameId);

    // Check if the game is already in the favorites
    final doc = await favoritesRef.get();

    if (!doc.exists) {
      // If the game is not already in the favorites, add it
      await favoritesRef.set({'gameId': gameId});
    }
  }

  /// Remove a game from the favorites
  /// Needs the [userId] and the [gameId] to remove the game
  Future<void> removeFavorite(String userId, String gameId) async {
    final docRef =
        _db.collection('users').doc(userId).collection('favorites').doc(gameId);
    await docRef.delete();
  }

  /// Get all the favorited games for a user
  /// Needs the [userId] to get the favorited games
  Future<List<String>> getFavorites(String userId) async {
    final querySnapshot =
        await _db.collection('users').doc(userId).collection('favorites').get();
    return querySnapshot.docs
        .map((doc) => doc.data()['gameId'] as String)
        .toList();
  }
}

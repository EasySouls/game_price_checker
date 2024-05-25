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
    final docRef = _db.collection('favorites').doc(userId);
    final doc = await docRef.get();
    if (doc.exists) {
      final games = doc.get('games') as List<String>..add(gameId);
      await docRef.update({'games': games});
    } else {
      await docRef.set(
        {
          'games': [gameId],
        },
      );
    }
  }

  /// Remove a game from the favorites
  /// Needs the [userId] and the [gameId] to remove the game
  Future<void> removeFavorite(String userId, String gameId) async {
    final docRef = _db.collection('favorites').doc(userId);
    final doc = await docRef.get();
    if (doc.exists) {
      final games = doc.get('games') as List<String>..remove(gameId);
      await docRef.update({'games': games});
    }
  }

  /// Get all the favorited games for a user
  /// Needs the [userId] to get the favorited games
  Future<List<String>> getFavorites(String userId) async {
    final doc = await _db.collection('favorites').doc(userId).get();
    if (doc.exists) {
      return (doc.get('games') as List<dynamic>).cast<String>();
    } else {
      return [];
    }
  }
}

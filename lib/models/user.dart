import 'package:thrifty/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String name;
  final String email;
  final double budget;
  final String photoURL;
  final Currency currency;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.budget,
    required this.photoURL,
    required this.currency,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFirebaseUser(auth.User? user) {
    if (user == null) {
      throw Exception('User cannot be null');
    }
    // This creates a partial user - budget and currency should be set later
    return User(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      budget: 0.0,
      photoURL: user.photoURL ?? '',
      currency: Currency(id: 'usd', name: 'US Dollar', symbol: '\$'),
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

import 'package:bethriftytoday/config/encrypt.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final String id;
  final Category category;
  final String description;
  final DateTime timestamp;
  final double amount;

  Transaction({
    required this.id,
    required this.category,
    required this.description,
    required this.timestamp,
    required this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'] as String,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        description: EncryptionService.decrypt(json['description'] ?? ''),
        timestamp: (json['timestamp'] as Timestamp).toDate(),
        amount: double.parse(EncryptionService.decrypt(json['amount'] ?? '')),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'category': category.toJson(),
        'description': EncryptionService.encrypt(description),
        'timestamp': timestamp,
        'amount': EncryptionService.encrypt(amount.toString()),
      };
}

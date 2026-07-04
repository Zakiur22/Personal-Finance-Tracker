import 'package:flutter/material.dart';
import 'package:bethriftytoday/models/models.dart';
import '../../domain/models/export_format.dart';
import '../../domain/repositories/export_repository.dart';
import '../..//data/repositories/export_repository_impl.dart';

class ExportController extends ChangeNotifier {
  final ExportRepository _repository = ExportRepositoryImpl();
  bool _isExporting = false;

  bool get isExporting => _isExporting;

  Future<void> export({
    required List<Transaction> transactions,
    required ExportFormat format,
    required String currencySymbol,
    required BuildContext context,
  }) async {
    _isExporting = true;
    notifyListeners();

    try {
      await _repository.exportTransactions(
        transactions: transactions,
        format: format,
        currencySymbol: currencySymbol,
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to export: $e')),
        );
      }
    } finally {
      _isExporting = false;
      notifyListeners();
    }
  }
}

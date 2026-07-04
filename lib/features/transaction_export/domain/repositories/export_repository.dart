import 'package:thrifty/models/models.dart';
import '../models/export_format.dart';

abstract class ExportRepository {
  Future<void> exportTransactions({
    required List<Transaction> transactions,
    required ExportFormat format,
    required String currencySymbol,
  });
}

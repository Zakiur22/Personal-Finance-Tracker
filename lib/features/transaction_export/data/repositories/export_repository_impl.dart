import 'dart:io';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';

import 'package:thrifty/models/models.dart';
import '../../domain/models/export_format.dart';
import '../../domain/repositories/export_repository.dart';

class ExportRepositoryImpl implements ExportRepository {
  @override
  Future<void> exportTransactions({
    required List<Transaction> transactions,
    required ExportFormat format,
    required String currencySymbol,
  }) async {
    if (format == ExportFormat.csv) {
      await _exportCsv(transactions, currencySymbol);
    } else {
      await _exportPdf(transactions, currencySymbol);
    }
  }

  Future<void> _exportCsv(List<Transaction> transactions, String currencySymbol) async {
    final List<List<dynamic>> rows = [];

    // Header row
    rows.add([
      'Transaction ID',
      'Date',
      'Category Name',
      'Type',
      'Description',
      'Amount ($currencySymbol)'
    ]);

    // Data rows
    for (var tx in transactions) {
      rows.add([
        tx.id,
        DateFormat('yyyy-MM-dd HH:mm').format(tx.timestamp),
        tx.category.name,
        tx.category.type,
        tx.description,
        '${tx.category.type == 'income' ? '' : '-'}${tx.amount.abs().toStringAsFixed(2)}'
      ]);
    }

    final csvContent = Csv().encode(rows);

    final directory = await getTemporaryDirectory();
    final file = File(
      "${directory.path}/bethriftytoday_report_${DateTime.now().millisecondsSinceEpoch}.csv"
    );
    await file.writeAsString(csvContent);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'My BeThriftyToday Financial CSV Export',
    );
  }

  Future<void> _exportPdf(List<Transaction> transactions, String currencySymbol) async {
    final pdf = pw.Document();

    // Calculate summary statistics
    double totalIncome = 0;
    double totalExpense = 0;
    for (var tx in transactions) {
      if (tx.category.type == 'income') {
        totalIncome += tx.amount;
      } else {
        totalExpense += tx.amount.abs();
      }
    }
    double netSavings = totalIncome - totalExpense;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) => [
          pw.Header(
            level: 0,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'BeThriftyToday - Financial Report',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 20),

          // Summary Dashboard Card-like UI
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryCard(
                'Total Income',
                '$currencySymbol${totalIncome.toStringAsFixed(2)}',
                PdfColors.green700,
              ),
              _buildSummaryCard(
                'Total Expense',
                '$currencySymbol${totalExpense.toStringAsFixed(2)}',
                PdfColors.red700,
              ),
              _buildSummaryCard(
                'Net Balance',
                '$currencySymbol${netSavings.toStringAsFixed(2)}',
                netSavings >= 0 ? PdfColors.blue700 : PdfColors.red700,
              ),
            ],
          ),
          pw.SizedBox(height: 30),

          pw.Text(
            'Transactions History',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 10),

          // Transactions Table
          pw.TableHelper.fromTextArray(
            headers: ['Date', 'Category', 'Type', 'Description', 'Amount'],
            data: transactions.map((tx) {
              return [
                DateFormat('yyyy-MM-dd HH:mm').format(tx.timestamp),
                tx.category.name,
                tx.category.type.toUpperCase(),
                tx.description,
                '${tx.category.type == 'income' ? '+' : '-'}$currencySymbol${tx.amount.abs().toStringAsFixed(2)}',
              ];
            }).toList(),
            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.blueGrey900,
            ),
            rowDecoration: const pw.BoxDecoration(
              border: pw.Border(
                bottom: pw.BorderSide(color: PdfColors.grey300, width: 0.5),
              ),
            ),
            cellAlignment: pw.Alignment.centerLeft,
            cellAlignments: {
              4: pw.Alignment.centerRight,
            },
          ),
        ],
      ),
    );

    final directory = await getTemporaryDirectory();
    final file = File(
      "${directory.path}/bethriftytoday_report_${DateTime.now().millisecondsSinceEpoch}.pdf"
    );
    await file.writeAsBytes(await pdf.save());

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'My BeThriftyToday Financial PDF Report',
    );
  }

  pw.Widget _buildSummaryCard(String title, String value, PdfColor color) {
    return pw.Container(
      width: 130,
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: color, width: 1.5),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            title.toUpperCase(),
            style: const pw.TextStyle(
              fontSize: 8,
              color: PdfColors.grey600,
            ),
          ),
          pw.SizedBox(height: 6),
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

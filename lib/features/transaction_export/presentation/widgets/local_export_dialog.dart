import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personal_finance_tracker/models/models.dart';
import 'package:personal_finance_tracker/services/services.dart';
import '../../domain/models/export_format.dart';
import '../controllers/export_controller.dart';

class LocalExportDialog extends StatefulWidget {
  final User user;

  const LocalExportDialog({Key? key, required this.user}) : super(key: key);

  @override
  State<LocalExportDialog> createState() => _LocalExportDialogState();
}

class _LocalExportDialogState extends State<LocalExportDialog> {
  ExportFormat _selectedFormat = ExportFormat.pdf;

  @override
  Widget build(BuildContext context) {
    final transactionService = TransactionDatabaseService(widget.user);

    return ChangeNotifierProvider<ExportController>(
      create: (_) => ExportController(),
      child: Consumer<ExportController>(
        builder: (context, controller, _) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: StreamBuilder<List<Transaction>>(
              stream: transactionService.transactions,
              builder: (context, snapshot) {
                final transactions = snapshot.data ?? [];
                final bool isLoading = snapshot.connectionState == ConnectionState.waiting;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Export Transactions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isLoading
                          ? 'Loading your transaction history...'
                          : 'You have ${transactions.length} transactions available for export.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Select Export Format',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _buildFormatCard(
                            context: context,
                            format: ExportFormat.pdf,
                            title: 'PDF Report',
                            subtitle: 'Beautiful multi-page layout with graphical summaries.',
                            icon: Icons.picture_as_pdf,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildFormatCard(
                            context: context,
                            format: ExportFormat.csv,
                            title: 'CSV Spreadsheet',
                            subtitle: 'Raw tabular format perfect for Excel/Google Sheets.',
                            icon: Icons.table_chart,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: (isLoading || transactions.isEmpty || controller.isExporting)
                          ? null
                          : () async {
                              await controller.export(
                                transactions: transactions,
                                format: _selectedFormat,
                                currencySymbol: widget.user.currency.symbol,
                                context: context,
                              );
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: controller.isExporting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Generate & Share Export',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormatCard({
    required BuildContext context,
    required ExportFormat format,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final bool isSelected = _selectedFormat == format;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFormat = format;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primary.withOpacity(0.08) // ignore: deprecated_member_use
              : Theme.of(context).cardColor,
          border: Border.all(
            color: isSelected ? colorScheme.primary : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: isSelected ? colorScheme.primary : Colors.grey[600],
              size: 28,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

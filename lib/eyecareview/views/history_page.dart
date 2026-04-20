import 'package:app_demo/eyecareview/core/data/data.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:app_demo/eyecareview/widgets/invoice_card_widget.dart';
import 'package:app_demo/eyecareview/widgets/prescription_card_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Invoice History')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PrescriptionCard(data: Data.prescription),
            const SizedBox(height: 20),
            InvoiceCard(data: Data.invoice),
          ],
        ),
      ),
    );
  }
}

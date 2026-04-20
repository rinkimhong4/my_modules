import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceCard extends StatefulWidget {
  final InvoiceData data;
  const InvoiceCard({super.key, required this.data});

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

DateTime now = DateTime.now();
String formatted = DateFormat('dd-MM-yyyy').format(now);

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _invoiceHeader(),
          _itemsTableHeader(),
          for (int i = 0; i < widget.data.items.length; i++)
            _InvoiceItemRow(
              item: widget.data.items[i],
              isLast: i == widget.data.items.length - 1,
            ),
        ],
      ),
    );
  }

  Widget _invoiceHeader() {
    final muted = Colors.white.withValues(alpha: 0.7);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryLight],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _HeaderColumn(
              label: 'INVOICE:',
              value: widget.data.number,
              alignment: CrossAxisAlignment.start,
              labelColor: muted,
            ),
            _HeaderColumn(
              label: 'DATE:',
              value: formatted,
              alignment: CrossAxisAlignment.center,
              labelColor: muted,
            ),
            _HeaderColumn(
              label: 'AMOUNT:',
              value: widget.data.amount,
              alignment: CrossAxisAlignment.end,
              labelColor: muted,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemsTableHeader() {
    const style = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      color: AppColors.primary,
    );
    return ColoredBox(
      color: AppColors.primary.withValues(alpha: 0.1),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            SizedBox(width: 40, child: Text('No', style: style)),
            Expanded(child: Text('Items Description', style: style)),
            SizedBox(
              width: 40,
              child: Text('Qty', textAlign: TextAlign.center, style: style),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderColumn extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment alignment;
  final Color labelColor;

  const _HeaderColumn({
    required this.label,
    required this.value,
    required this.alignment,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(label, style: TextStyle(fontSize: 11, color: labelColor)),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _InvoiceItemRow extends StatelessWidget {
  final InvoiceItem item;
  final bool isLast;

  const _InvoiceItemRow({required this.item, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                item.no,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            Expanded(
              child: Text(
                item.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: Text(
                item.qty,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_demo/eyecareview/core/models/app_models.dart';
import 'package:app_demo/eyecareview/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrescriptionCard extends StatelessWidget {
  final PrescriptionData data;
  const PrescriptionCard({super.key, required this.data});

  static const _headers = ['SPH.', 'CYL.', 'AXIS.', 'ADD', 'P.D', 'BC', 'AC'];

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 6,
      shadowColor: AppColors.primary.withValues(alpha: 0.3),
      clipBehavior: Clip.antiAlias,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withValues(alpha: 0.9),
              AppColors.primaryLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _cardTitle('EYE PRESCRIPTION'),
            _opticianRow(),
            _tableHeader(),
            _PrescriptionRow(label: 'RIGHT', values: data.rightValues),
            _PrescriptionRow(
              label: 'LEFT',
              values: data.leftValues,
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardTitle(String title) {
    return ColoredBox(
      color: AppColors.primaryDark.withValues(alpha: 0.4),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _opticianRow() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Optician: ${data.optician}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Text(
                'V.A',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableHeader() {
    return ColoredBox(
      color: AppColors.primary.withValues(alpha: 0.5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          children: [
            const SizedBox(width: 60),
            for (final h in _headers)
              Expanded(
                child: Text(
                  h,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PrescriptionRow extends StatelessWidget {
  final String label;
  final List<String> values;
  final bool isLast;

  const _PrescriptionRow({
    required this.label,
    required this.values,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            for (final v in values)
              Expanded(
                child: Text(
                  v,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyState({
    required this.message,
    this.icon = Icons.tv_off_outlined,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 52,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
        ),
        const SizedBox(height: 12),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.4),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );
}

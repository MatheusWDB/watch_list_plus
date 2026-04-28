import 'package:flutter/material.dart';

class DropdownChip<T> extends StatelessWidget {
  final String label;
  final bool isActive;
  final List<T> values;
  final String Function(T) labelOf;
  final void Function(T) onSelected;
  final VoidCallback onClear;

  const DropdownChip({
    required this.label,
    required this.isActive,
    required this.values,
    required this.labelOf,
    required this.onSelected,
    required this.onClear,
    super.key,
  });

  void _onSelected(GlobalKey<PopupMenuButtonState<T>> menuKey) {
    {
      if (isActive) {
        onClear();
      } else {
        menuKey.currentState?.showButtonMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuKey = GlobalKey<PopupMenuButtonState<T>>();
    final colors = Theme.of(context).colorScheme;

    return PopupMenuButton<T>(
      key: menuKey,
      tooltip: '',
      offset: const Offset(0, 36),
      onSelected: onSelected,
      itemBuilder: (_) => values
          .map((v) => PopupMenuItem<T>(value: v, child: Text(labelOf(v))))
          .toList(),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Text(label),
            Icon(
              isActive ? Icons.close_rounded : Icons.arrow_drop_down_rounded,
              size: 16,
              color: isActive ? colors.onSecondaryContainer : colors.onSurface,
            ),
          ],
        ),
        selected: isActive,
        showCheckmark: false,
        onSelected: (_) => _onSelected(menuKey),
      ),
    );
  }
}

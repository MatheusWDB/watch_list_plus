import 'package:flutter/material.dart';

class DropdownChip<T> extends StatefulWidget {
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

  @override
  State<DropdownChip<T>> createState() => _DropdownChipState<T>();
}

class _DropdownChipState<T> extends State<DropdownChip<T>> {
  final _menuKey = GlobalKey<PopupMenuButtonState<T>>();

  void _handleTap() {
    if (widget.isActive) {
      widget.onClear();
    } else {
      _menuKey.currentState?.showButtonMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return PopupMenuButton<T>(
      key: _menuKey,
      tooltip: '',
      offset: const Offset(0, 36),
      onSelected: widget.onSelected,
      itemBuilder: (_) => widget.values
          .map(
            (v) => PopupMenuItem<T>(value: v, child: Text(widget.labelOf(v))),
          )
          .toList(),
      child: FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Text(widget.label),
            Icon(
              widget.isActive
                  ? Icons.close_rounded
                  : Icons.arrow_drop_down_rounded,
              size: 16,
              color: widget.isActive
                  ? colors.onSecondaryContainer
                  : colors.onSurface,
            ),
          ],
        ),
        selected: widget.isActive,
        showCheckmark: false,
        onSelected: (_) => _handleTap(),
      ),
    );
  }
}

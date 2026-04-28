import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watchlist_plus/enums/access_enum.dart';
import 'package:watchlist_plus/enums/category_enum.dart';
import 'package:watchlist_plus/enums/streaming_enum.dart';
import 'package:watchlist_plus/l10n/app_localization.dart';
import 'package:watchlist_plus/models/production.dart';
import 'package:watchlist_plus/models/streaming.dart';
import 'package:watchlist_plus/providers/production_list_provider.dart';

class AddOrUpdateScreen extends ConsumerStatefulWidget {
  final Production? production;

  const AddOrUpdateScreen({this.production, super.key});

  @override
  ConsumerState<AddOrUpdateScreen> createState() => _AddOrUpdateScreenState();
}

class _AddOrUpdateScreenState extends ConsumerState<AddOrUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  int _step = 0;
  CategoryEnum _category = CategoryEnum.absent;
  final Map<StreamingEnum, AccessEnum> _streamingMap = {};

  bool get _isEditing => widget.production != null;

  void _save() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _step = 0);
      return;
    }
    if (_category == CategoryEnum.absent) {
      setState(() => _step = 0);
      _showError(AppLocalizations.of(context)!.required);
      return;
    }
    if (_streamingMap.isEmpty) {
      setState(() => _step = 1);
      _showError(AppLocalizations.of(context)!.chooseAtLeastOne);
      return;
    }
    if (_streamingMap.values.any((a) => a == AccessEnum.absent)) {
      setState(() => _step = 1);
      _showError(AppLocalizations.of(context)!.required);
      return;
    }

    HapticFeedback.mediumImpact();

    final streamings =
        _streamingMap.entries
            .map((e) => Streaming(service: e.key, access: e.value))
            .toList()
          ..sort(
            (a, b) => a.service.displayName.compareTo(b.service.displayName),
          );

    if (_isEditing) {
      ref
          .read(productionListProvider.notifier)
          .updateProduction(
            widget.production!.copyWith(
              title: _titleController.text.trim(),
              category: _category,
              streaming: streamings,
            ),
          );
    } else {
      ref
          .read(productionListProvider.notifier)
          .add(
            Production(
              title: _titleController.text.trim(),
              category: _category,
              streaming: streamings,
              createdAt: DateTime.now(),
            ),
          );
    }

    Navigator.pop(context);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Step _step0(AppLocalizations t) => Step(
    title: Text(t.title),
    isActive: _step >= 0,
    state: _step > 0 ? StepState.complete : StepState.indexed,
    content: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          // Title field
          TextFormField(
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: t.title,
              hintText: t.addNewTitle,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.title_rounded),
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? t.requiredField : null,
          ),

          // Category dropdown
          DropdownButtonFormField<CategoryEnum>(
            initialValue: _category == CategoryEnum.absent ? null : _category,
            hint: Text(t.selectCategory),
            isExpanded: true,
            decoration: InputDecoration(
              labelText: t.category,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.category_outlined),
            ),
            items: CategoryEnum.values
                .where((c) => c != CategoryEnum.absent)
                .map(
                  (c) => DropdownMenuItem(
                    value: c,
                    child: Text(c.displayNameTranslate(context)),
                  ),
                )
                .toList(),
            onChanged: (v) => setState(() => _category = v!),
            validator: (v) => v == null ? t.required : null,
          ),
        ],
      ),
    ),
  );

  Step _step1(AppLocalizations t) => Step(
    title: Text(t.availableOn),
    isActive: _step >= 1,
    state: _step > 1 ? StepState.complete : StepState.indexed,
    content: Column(
      children: StreamingEnum.values
          .where((s) => s != StreamingEnum.absent)
          .map((service) {
            final isSelected = _streamingMap.containsKey(service);
            final access = _streamingMap[service] ?? AccessEnum.absent;

            return Column(
              children: [
                CheckboxListTile(
                  value: isSelected,
                  title: Text(service.displayNameTranslate(context)),
                  contentPadding: EdgeInsets.zero,
                  onChanged: (checked) => setState(() {
                    if (checked == true) {
                      _streamingMap[service] = AccessEnum.absent;
                    } else {
                      _streamingMap.remove(service);
                    }
                  }),
                ),
                if (isSelected)
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 8),
                    child: DropdownButtonFormField<AccessEnum>(
                      initialValue: access == AccessEnum.absent ? null : access,
                      hint: Text(t.selectAccess),
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: t.accessMode,
                        border: const OutlineInputBorder(),
                        isDense: true,
                      ),
                      items: AccessEnum.values
                          .where((a) => a != AccessEnum.absent)
                          .map(
                            (a) => DropdownMenuItem(
                              value: a,
                              child: Text(a.displayNameTranslate(context)),
                            ),
                          )
                          .toList(),
                      onChanged: (v) =>
                          setState(() => _streamingMap[service] = v!),
                    ),
                  ),
                const Divider(height: 1),
              ],
            );
          })
          .toList(),
    ),
  );

  void _onStepContinue(AppLocalizations t) {
    if (_step == 0) {
      if (!_formKey.currentState!.validate()) return;
      if (_category == CategoryEnum.absent) {
        _showError(t.required);
        return;
      }
      setState(() => _step = 1);
    } else {
      _save();
    }
  }

  void _onStepCancel() {
    if (_step > 0) {
      setState(() => _step--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      final p = widget.production!;
      _titleController.text = p.title;
      _category = p.category;
      for (final s in p.streaming) {
        _streamingMap[s.service] = s.access;
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(_isEditing ? t.editTitle : t.addNewTitle)),
      body: Stepper(
        currentStep: _step,
        onStepTapped: (s) => setState(() => _step = s),
        onStepContinue: () => _onStepContinue(t),
        onStepCancel: () => _onStepCancel(),
        controlsBuilder: (context, details) => Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            spacing: 8,
            children: [
              FilledButton(
                onPressed: details.onStepContinue,
                child: Text(_step == 1 ? t.save : t.confirm),
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: Text(_step == 0 ? t.cancel : t.back),
              ),
            ],
          ),
        ),
        steps: [_step0(t), _step1(t)],
      ),
    );
  }
}

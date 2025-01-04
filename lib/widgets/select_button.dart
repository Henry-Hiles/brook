import 'package:canal/helpers/extension_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectButton<T extends Enum> extends HookWidget {
  final T defaultValue;
  final List<T> values;
  const SelectButton({
    required this.defaultValue,
    required this.values,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selected = useState(defaultValue);
    final oldValue = useState(<T>{});
    return SegmentedButton(
      segments: values
          .map((value) => ButtonSegment(
                value: value,
                label: Text(value.name.toCapitalized()),
              ))
          .toList(),
      onSelectionChanged: (newValue) {
        selected.value = newValue.difference(oldValue.value).first;
        oldValue.value = newValue;
      },
      selected: {selected.value},
    );
  }
}

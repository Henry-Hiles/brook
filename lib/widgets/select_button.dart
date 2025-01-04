import 'package:canal/helpers/extension_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SelectButton<T extends Enum> extends HookWidget {
  final T value;
  final List<T> values;
  final Function(T newValue) onChanged;
  const SelectButton({
    required this.value,
    required this.values,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final oldValue = useState(<T>{});
    return SegmentedButton(
      segments: values
          .map((value) => ButtonSegment(
                value: value,
                label: Text(value.name.toCapitalized()),
              ))
          .toList(),
      onSelectionChanged: (newValue) {
        onChanged(newValue.difference(oldValue.value).first);
        oldValue.value = newValue;
      },
      selected: {value},
    );
  }
}

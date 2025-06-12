import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_care/core/service_locator.dart';

import '../cubit/money_cubit.dart';

class AddMoneyRecordScreen extends StatefulWidget {
  const AddMoneyRecordScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddMoneyRecordScreen();
  }
}

class _AddMoneyRecordScreen extends State<AddMoneyRecordScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24HourTime = false;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  Future<void> _selectTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: entryMode,
      orientation: orientation,
      builder: (BuildContext context, Widget? child) {
        // We just wrap these environmental changes around the
        // child in this builder so that we can apply the
        // options selected above. In regular usage, this is
        // rarely necessary, because the default values are
        // usually used as-is.
        return Theme(
          data: Theme.of(
            context,
          ).copyWith(materialTapTargetSize: tapTargetSize),
          child: Directionality(
            textDirection: textDirection,
            child: MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(alwaysUse24HourFormat: use24HourTime),
              child: child!,
            ),
          ),
        );
      },
    );
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<MoneyCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Add Money")),
        body: Column(
          children: [
            OutlinedButton(
              onPressed: _selectDate,
              child: const Text('Select Date'),
            ),
            Text(
              selectedDate != null
                  ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                  : 'No date selected',
            ),
            ElevatedButton(
              onPressed: _selectTime,
              child: const Text('Open time picker'),
            ),
            if (selectedTime != null) Text('Selected time: ${selectedTime!.format(context)}'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppointmentScheduler extends StatefulWidget {
  const AppointmentScheduler({super.key});

  @override
  _AppointmentSchedulerState createState() => _AppointmentSchedulerState();
}

class _AppointmentSchedulerState extends State<AppointmentScheduler> {
  late DateTime selectedDate;
  late TimeOfDay
      selectedTime; // Adicionando 'late' para indicar que será inicializado posteriormente

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now(); // Inicializando selectedTime
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text('Selecione a data'),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () => _selectTime(context),
          child: const Text('Selecione a hora'),
        ),
        const SizedBox(height: 16.0),
        Text(
          'Data selecionada: ${selectedDate.toString()}',
        ),
        const SizedBox(height: 16.0),
        Text(
          'Hora selecionada: ${selectedTime.format(context)}',
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Agendamento'),
      ),
      body: const Center(
        child: AppointmentScheduler(),
      ),
    ),
  ));
}

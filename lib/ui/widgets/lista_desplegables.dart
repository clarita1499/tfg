import 'package:flutter/material.dart';

List<String> puestosDeTrabajo = <String>["Profesor", "Secretaría", "Dirección"];

class lista_desplegable extends StatelessWidget{
  @override
  lista_desplegable({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: const Center(
            child: DropdownButtonExample(),
          ),
        ),
    );
  }
}
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = puestosDeTrabajo.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: puestosDeTrabajo.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

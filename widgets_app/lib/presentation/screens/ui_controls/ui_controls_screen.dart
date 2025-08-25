import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  static const name = "ui_controls_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum ListaUtiles { papel, plastica, vidrio, organicos, pet, otros }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isSwitch = true;
  bool isChecked = false;
  bool isChecked2 = false;
  ListaUtiles selectedLista = ListaUtiles.papel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        //SwitchListTile
        SwitchListTile(
          title: const Text("Switch List Tile"),
          subtitle: const Text("Use a switch inside a list tile"),
          value: isSwitch,
          onChanged: (value) {
            setState(() {
              isSwitch = !isSwitch;
            });
          },
        ),
        //radioListTile
        const SizedBox(height: 20),
        Text(
          "Radio List Tile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        RadioListTile<ListaUtiles>(
          title: const Text("Papel"),
          subtitle: const Text("Use a radio inside a list tile"),
          value: ListaUtiles.papel,
          groupValue: selectedLista,
          onChanged: (value) {
            setState(() {
              selectedLista = value!;
            });
          },
        ),
        RadioListTile<ListaUtiles>(
          title: const Text("Plástico"),
          subtitle: const Text("Use a radio inside a list tile"),
          value: ListaUtiles.plastica,
          groupValue: selectedLista,
          onChanged: (value) {
            setState(() {
              selectedLista = value!;
            });
          },
        ),
        RadioListTile<ListaUtiles>(
          title: const Text("Vidrio"),
          subtitle: const Text("Use a radio inside a list tile"),
          value: ListaUtiles.vidrio,
          groupValue: selectedLista,
          onChanged: (value) {
            setState(() {
              selectedLista = value!;
            });
          },
        ),
        RadioListTile<ListaUtiles>(
          title: const Text("Orgánicos"),
          subtitle: const Text("Use a radio inside a list tile"),
          value: ListaUtiles.organicos,
          groupValue: selectedLista,
          onChanged: (value) {
            setState(() {
              selectedLista = value!;
            });
          },
        ),
        RadioListTile<ListaUtiles>(
          title: const Text("Pet"),
          subtitle: const Text("Use a radio inside a list tile"),
          value: ListaUtiles.pet,
          groupValue: selectedLista,
          onChanged: (value) {
            setState(() {
              selectedLista = value!;
            });
          },
        ),
        RadioListTile<ListaUtiles>(
          title: const Text("Otros"),
          subtitle: const Text("Use a radio inside a list tile"),
          value: ListaUtiles.otros,
          groupValue: selectedLista,
          onChanged: (value) {
            setState(() {
              selectedLista = value!;
            });
          },
        ),
        //expansionTile
        const SizedBox(height: 20),
        Text(
          "Expansion Tile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        ExpansionTile(
          title: const Text("Lista Utiles"),
          subtitle: const Text("Use a expansion tile inside a list tile"),
          children: [
            RadioListTile<ListaUtiles>(
              title: const Text("Papel"),
              subtitle: const Text("Use a radio inside a list tile"),
              value: ListaUtiles.papel,
              groupValue: selectedLista,
              onChanged: (value) {
                setState(() {
                  selectedLista = value!;
                });
              },
            ),
            RadioListTile<ListaUtiles>(
              title: const Text("Plástico"),
              subtitle: const Text("Use a radio inside a list tile"),
              value: ListaUtiles.plastica,
              groupValue: selectedLista,
              onChanged: (value) {
                setState(() {
                  selectedLista = value!;
                });
              },
            ),
            RadioListTile<ListaUtiles>(
              title: const Text("Vidrio"),
              subtitle: const Text("Use a radio inside a list tile"),
              value: ListaUtiles.vidrio,
              groupValue: selectedLista,
              onChanged: (value) {
                setState(() {
                  selectedLista = value!;
                });
              },
            ),
            RadioListTile<ListaUtiles>(
              title: const Text("Orgánicos"),
              subtitle: const Text("Use a radio inside a list tile"),
              value: ListaUtiles.organicos,
              groupValue: selectedLista,
              onChanged: (value) {
                setState(() {
                  selectedLista = value!;
                });
              },
            ),
            RadioListTile<ListaUtiles>(
              title: const Text("Pet"),
              subtitle: const Text("Use a radio inside a list tile"),
              value: ListaUtiles.pet,
              groupValue: selectedLista,
              onChanged: (value) {
                setState(() {
                  selectedLista = value!;
                });
              },
            ),
            RadioListTile<ListaUtiles>(
              title: const Text("Otros"),
              subtitle: const Text("Use a radio inside a list tile"),
              value: ListaUtiles.otros,
              groupValue: selectedLista,
              onChanged: (value) {
                setState(() {
                  selectedLista = value!;
                });
              },
            ),
          ],
        ),
        //checkboxListTile
        const SizedBox(height: 20),
        Text(
          "Checkbox List Tile",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        CheckboxListTile(
          title: const Text("Use a checkbox inside a list tile"),
          subtitle: const Text("Use a checkbox inside a list tile"),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = !isChecked;
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Use a checkbox inside a list tile"),
          subtitle: const Text("Use a checkbox inside a list tile"),
          value: isChecked2,
          onChanged: (value) {
            setState(() {
              isChecked2 = !isChecked2;
            });
          },
        ),
        //dateTimePicker
        const SizedBox(height: 20),
        Text(
          "Date Time Picker",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
        ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2025),
              lastDate: DateTime(2026),
            );
          },
          child: const Text("Date Time Picker"),
        ),
      ],
    );
  }
}

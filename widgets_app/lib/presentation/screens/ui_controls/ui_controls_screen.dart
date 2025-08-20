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
      ],
    );
  }
}

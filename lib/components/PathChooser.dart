import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/WilayaDropDown.dart';
import 'package:ii_cpi_project/constantes/Constants.dart';

class TragetChooser extends StatefulWidget {
  final void Function(List<String> traget) onChoosePath;
  TragetChooser.listWilaya({this.onChoosePath});

  @override
  _TragetChooserState createState() => _TragetChooserState();
}

class _TragetChooserState extends State<TragetChooser> {
  List<String> path = [null];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: getWilayatWidgets(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = path.removeAt(oldIndex);
          path.insert(newIndex, item);
          returnTheTraget();
        });
      },
    );
  }

  List<Widget> getWilayatWidgets() {
    List<Widget> l = [];
    for (int index = 0; index < path.length; index++) {
      List<String> kWilaya2 = List.from(kWilayaNumerated);
      for (int i = 0; i < path.length; i++) {
        if (i == index) continue;
        kWilaya2.remove(path[i]);
      }
      l.add(
        WIlayaDropDown(
          key: Key("$index"),
          wilayat: List.from(kWilaya2),
          wilaya: path[index],
          onDeletIconPressed: () {
            path.remove(path[index]);
            setState(() {});
          },
          onChooseWilaya: (_) {
            setState(
              () {
                path[index] = _;
                if (path.indexOf(null) == -1) path.insert(path.length, null);
                returnTheTraget();
              },
            );
          },
        ),
      );
    }
    return l;
  }

  void returnTheTraget() {
    List<String> traget = List.from(path);
    traget.remove(null);
    widget.onChoosePath(traget);
  }
}

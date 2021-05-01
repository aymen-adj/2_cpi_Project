import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/wilaya-widget.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class ListWilayaWedget extends StatefulWidget {
  final void Function(List<String> traget) onChooseTraget;
  ListWilayaWedget.listWilaya({this.onChooseTraget});

  @override
  _ListWilayaWedgetState createState() => _ListWilayaWedgetState();
}

class _ListWilayaWedgetState extends State<ListWilayaWedget> {
  List<String> _traget = [null];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: getWilayatWidgets(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = _traget.removeAt(oldIndex);
          _traget.insert(newIndex, item);
          returnTheTraget();
        });
      },
    );
  }

  List<Widget> getWilayatWidgets() {
    List<Widget> l = [];
    for (int index = 0; index < _traget.length; index++) {
      List<String> kWilaya2 = List.from(kWilayaNumerated);
      for (int i = 0; i < _traget.length; i++) {
        if (i == index) continue;
        kWilaya2.remove(_traget[i]);
      }
      l.add(
        WilayaWidget(
          key: Key("$index"),
          wilayat: List.from(kWilaya2),
          wilaya: _traget[index],
          onDeletIconPressed: () {
            _traget.remove(_traget[index]);
            setState(() {});
          },
          onChooseWilaya: (_) {
            setState(
              () {
                _traget[index] = _;
                if (_traget.indexOf(null) == -1)
                  _traget.insert(_traget.length, null);
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
    List<String> traget = List.from(_traget);
    traget.remove(null);
    widget.onChooseTraget(traget);
  }
}

import 'package:flutter/material.dart';
import 'package:ii_cpi_project/components/wilaya-widget.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class ListWilayaWedget extends StatefulWidget {
  void Function(List<String> traget) onChooseTraget;
  ListWilayaWedget({this.onChooseTraget});

  @override
  _ListWilayaWedgetState createState() => _ListWilayaWedgetState();
}

class _ListWilayaWedgetState extends State<ListWilayaWedget> {
  List<String> _traget = [null];

  @override
  Widget build(BuildContext context) {
    List<String> elwilayat = kWilaya;
    return ReorderableListView(
      children: [
        for (int index = 0; index < _traget.length; index++)
          WilayaWidget(
            key: Key("$index"),
            wilayat: elwilayat,
            wilaya: _traget[index],
            onDeletIconPressed: () {
              _traget.remove(_traget[index]);
              setState(() {});
            },
            onChooseWilaya: (_) {
              if (!_traget.contains(_)) _traget[index] = _;
              if (_traget.indexOf(null) == -1)
                _traget.insert(_traget.length, null);
              List<String> traget = List.from(_traget);
              traget.remove(null);
              widget.onChooseTraget(traget);
              setState(() {});
            },
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final String item = _traget.removeAt(oldIndex);
          _traget.insert(newIndex, item);
        });
      },
    );
  }
}

//   List<Widget> getChildren() {
//     List<String> elwilayat = List.from(kWilaya);
//     List<Widget> addWilaya = [];
//     for (int index = 0; index < _traget.length; index++) {
//       addWilaya.add(WilayaWidget(
//         key: Key("$index"),
//         wilayat: elwilayat,
//         wilaya: _traget[index],
//         onDeletIconPressed: () {
//           _traget.remove(_traget[index]);
//           setState(() {});
//         },
//         onChooseWilaya: (_) {
//           _traget[index] = _;

//           if (_traget.indexOf(null) == -1) _traget.insert(_traget.length, null);
//           List<String> traget = List.from(_traget);
//           traget.remove(null);
//           widget.onChooseTraget(traget);
//           setState(() {});
//         },
//       ));
//       elwilayat.remove(_traget[index]);
//     }
//     return addWilaya;
//   }

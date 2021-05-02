import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BasicContainerWithShadow.dart';

class WilayaWidget extends StatelessWidget {
  final void Function() onDeletIconPressed;
  final void Function(String newWilaya) onChooseWilaya;
  final Key key;
  final String wilaya;
  final List<String> wilayat;

  WilayaWidget(
      {@required this.onDeletIconPressed,
      this.onChooseWilaya,
      this.key,
      this.wilaya,
      this.wilayat});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    for (int i = 0; i < wilayat.length; i++) {
      items.add(DropdownMenuItem(
        value: wilayat[i],
        child: Text(wilayat[i]),
      ));
    }
    return ListTile(
      key: key,
      leading: wilaya == null
          ? SizedBox(
              width: 24,
            )
          : Icon(Icons.reorder),
      trailing: wilaya == null
          ? SizedBox(
              width: 48,
            )
          : IconButton(
              icon: Icon(Icons.cancel),
              onPressed: onDeletIconPressed,
            ),
      title: BasicContainerWithShadow(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            items: items,
            value: wilaya,
            hint: Center(child: Icon(Icons.add)),
            iconSize: 0,
            onChanged: onChooseWilaya,
          ),
        ),
      ),
    );
  }
}

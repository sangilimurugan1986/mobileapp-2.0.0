import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class SingleItemTableFolder extends StatelessWidget {
  SingleItemTableFolder(this.Detials);
  Map<String, dynamic> Detials;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return mainhead(Detials);
  }

  Widget mainhead(final nodes) {
    return Expanded(
        child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: Detials.length,
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.fromLTRB(15, 1, 15, 1),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    child: Text(
                        StringUtils.toPascalCase(Detials.keys.elementAt(index)),
                        style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  )),
                  Expanded(
                      child: Container(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: staticValidation(
                                Detials.values.elementAt(index).toString())
                            ? Text(
                                "\u2022 " +
                                    StringUtils.toPascalCase(Detials.values
                                        .elementAt(index)
                                        .toString()),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500))
                            : Text(
                                StringUtils.toPascalCase(
                                    Detials.values.elementAt(index).toString()),
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500))),
                  )),
                ]));
      },
    ));
  }

  bool staticValidation(String sTemp) {
    if (sTemp.toLowerCase().contains('static')) return true;
    return false;
  }
}

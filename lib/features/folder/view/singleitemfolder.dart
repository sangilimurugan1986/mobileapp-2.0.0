import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../../core/v5/utils/file_fns.dart';

class SingleItemTableFolder extends StatelessWidget {
  SingleItemTableFolder(this.Detials);
  Map<String, dynamic> Detials;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return mainhead(Detials);
  }

  Widget mainhead(final nodes) {
    return Column(children: [
      Container(
          //padding: EdgeInsets.all(2),
          margin: EdgeInsets.fromLTRB(15, 1, 15, 1),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  child: Text(StringUtils.toPascalCase('WorkSpace'),
                      style: const TextStyle(
                          color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w500)),
                )),
                Expanded(
                    child: Container(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          Detials['workspace'] != null
                              ? StringUtils.toPascalCase(Detials['workspace'].toString())
                              : '-',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500))),
                )),
              ])),
      Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.fromLTRB(15, 1, 15, 1),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  child: Text(StringUtils.toPascalCase('fieldsType'),
                      style: const TextStyle(
                          color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w500)),
                )),
                Expanded(
                    child: Container(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: staticValidation(Detials['fieldsType'])
                          ? Text("\u2022 " + StringUtils.toPascalCase(Detials['fieldsType']),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 13, fontWeight: FontWeight.w500))
                          : Text("\u2022 " + StringUtils.toPascalCase(Detials['fieldsType']),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500))),
                )),
              ])),
      Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.fromLTRB(15, 1, 15, 1),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  child: Text(StringUtils.toPascalCase('Files'),
                      style: const TextStyle(
                          color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w500)),
                )),
                Expanded(
                    child: Container(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(StringUtils.toPascalCase(Detials['filesCount'].toString()),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500))),
                )),
              ])),
      Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.fromLTRB(15, 1, 15, 1),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  child: Text(StringUtils.toPascalCase('FileSize'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w500)),
                )),
                Expanded(
                    child: Container(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          StringUtils.toPascalCase(formatFileSize(Detials['fileSize']).toString()),
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500))),
                )),
              ]))
    ]);
  }

  bool staticValidation(String sTemp) {
    if (sTemp.toLowerCase().contains('static')) return true;
    return false;
  }
}

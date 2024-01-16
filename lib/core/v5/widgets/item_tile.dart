import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    this.action,
    required this.avatar,
    required this.subtitle,
    required this.title,
    this.status = '',
    this.statusColor = Colors.white12,
  }) : super(key: key);

  final Widget? action;
  final Widget avatar;
  final String subtitle;
  final String status;
  final Color statusColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black12.withOpacity(.1),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        //color: Colors.white,
        height: 50,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            avatar,
            const SizedBox(height: 10),
            // title
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),

            // ..
            const SizedBox(height: 6),
            // subtitle

            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),

            // ...
            const SizedBox(height: 5),
            // status
            if (status != '')
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            // ...
          ],
        ));
  }
}

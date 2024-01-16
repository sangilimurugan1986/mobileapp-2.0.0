import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme.dart';
import '../models/nodule.dart';

class _Breadcrumb extends StatelessWidget {
  const _Breadcrumb({
    required this.breadcrumb,
    this.isActive = false,
    required this.onTap,
  });

  final Nodule breadcrumb;
  final bool isActive;
  final void Function(Nodule) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(breadcrumb),
        child: Text(breadcrumb.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? Colors.grey.shade600 : Colors.grey.shade400,
              // fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            )));
  }
}

class _Caret extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
    );
  }
}

List<Widget> processBreadcrumbs(
    List<Nodule> breadcrumbs, void Function(Nodule) onTap) {
  return breadcrumbs.fold([], (list, element) {
    if (element == breadcrumbs.first) {
      list.add(_Breadcrumb(
        breadcrumb: element,
        onTap: onTap,
      ));
    } else if (element == breadcrumbs.last) {
      list.add(_Caret());
      list.add(_Breadcrumb(
        breadcrumb: element,
        isActive: true,
        onTap: onTap,
      ));
    } else {
      list.add(_Caret());
      list.add(_Breadcrumb(
        breadcrumb: element,
        onTap: onTap,
      ));
    }
    return list;
  });
}

class Breadcrumbs extends StatelessWidget {
  const Breadcrumbs({
    Key? key,
    required this.breadcrumbs,
    required this.onTap,
  }) : super(key: key);

  final List<Nodule> breadcrumbs;
  final void Function(Nodule) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: processBreadcrumbs(breadcrumbs, onTap),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/theme.dart';
import '../controllers/batchworkfolderbrowsecontroller.dart';
import '../models/nodule.dart';
import '../utils/file_fns.dart';
import '../utils/format_date_time.dart';
import '../utils/nodule_type.dart';
import 'item_tile.dart';

Widget _avatar(Nodule nodule) {
  switch (nodule.type) {
    case NoduleType.Repository:
      return const Icon(
        Icons.inventory,
        color: BrandColors.secondary,
      );

    case NoduleType.Folder:
      return Icon(
        Icons.folder,
        color: Colors.amberAccent,
      );

    case NoduleType.File:
      return Image.asset(
        fileIcon(nodule.name),
        height: 24,
        width: 24,
      );
  }
}

String _subtitle(Nodule nodule) {
  switch (nodule.type) {
    case NoduleType.File:
      // return '${formatDateTime(nodule.modifiedAt)}';
      return '${formatFileSize(nodule.size)} - ${formatDateTime(nodule.modifiedAt)}';
    default:
      return 'Level 1 \u2022 ${nodule.itemsCount} Files - ${formatFileSize(nodule.size)}';
      '${nodule.itemsCount} - ${formatDateTime(nodule.size.toString())}';
  }
}

class NoduleList extends StatelessWidget {
  NoduleList({Key? key}) : super(key: key);
  final controller = Get.find<BatchWorkFolderBrowseController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.nodules.isEmpty
        ? const Center(
            child: Text(
              'No data found',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          )
        : GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                //maxCrossAxisExtent: 540,
                mainAxisExtent: 110, //40,150,42,15,55,10,10,10,40 7
                mainAxisSpacing: 0,
                crossAxisCount: 2),
            itemCount: controller.nodules.length,
            itemBuilder: (BuildContext context, int index) {
              final nodule = controller.nodules[index];
              return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Obx(
                      () => ItemTile(
                        avatar: _avatar(nodule),
                        title: nodule.name,
                        subtitle: _subtitle(nodule),
                        action: controller.selectedFile.value == nodule.id
                            ? const Icon(
                                EvaIcons.checkmarkCircle2,
                                color: BrandColors.secondary,
                              )
                            : null,
                      ),
                    ),
                    onTap: () => controller.onNoduleTap(nodule),
                  ));
            },
          ));
  }
}

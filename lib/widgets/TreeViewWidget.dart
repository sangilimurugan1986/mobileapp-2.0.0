import 'package:flutter/cupertino.dart';

import 'TreeNode.dart';
import 'TreeView.dart';

class TreeViewWidget extends StatelessWidget {
  final List<TreeNode> nodes = [
    TreeNode(
      title: 'Shared Inbox',
      children: [
        TreeNode(
          title: 'SIGNODE Productions',
          children: [
            TreeNode(title: 'Grandchild 1', children: []),
            TreeNode(title: 'Grandchild 2', children: []),
          ],
        ),
        TreeNode(title: 'Cost Optimization', children: []),
      ],
    ),
    TreeNode(title: 'My Inbox', children: [
      TreeNode(title: 'sang', children: []),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return TreeView(nodes: nodes);
  }
}

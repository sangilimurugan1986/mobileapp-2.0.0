import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TreeNode.dart';

class TreeView extends StatelessWidget {
  final List<TreeNode> nodes;

  TreeView({required this.nodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: nodes.length,
      itemBuilder: (context, index) {
        final node = nodes[index];
        return _buildNodeTile(node);
      },
    );
  }

  Widget _buildNodeTile(TreeNode node) {
    return ExpansionTile(
      title: Text(node.title),
      children:
          node.children.map((childNode) => _buildNodeTile(childNode)).toList(),
      onExpansionChanged: (isExpanded) {
        node.isExpanded = isExpanded;
      },
      initiallyExpanded: node.isExpanded,
/*      leading: Icon(
        Icons.arrow_back,
      ),
      trailing: Icon(
        Icons.face,
        size: 36.0,
      ),*/
    );
  }
}

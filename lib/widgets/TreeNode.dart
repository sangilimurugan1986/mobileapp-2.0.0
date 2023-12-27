class TreeNode {
  String title;
  List<TreeNode> children;
  bool isExpanded;

  TreeNode(
      {required this.title, required this.children, this.isExpanded = false});
}

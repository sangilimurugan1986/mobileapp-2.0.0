class FolderData {
  String sWorkspaceName, sType, sFilesize;
  int iFileCount;
  FolderData(
      {required this.sWorkspaceName,
      required this.sType,
      required this.sFilesize,
      required this.iFileCount});

  factory FolderData.fromJSON(Map<String, dynamic> json) {
    return FolderData(
        sWorkspaceName: json["workspace"],
        sType: json["type"],
        sFilesize: json["filesize"],
        iFileCount: json["filecount"]);
  }
  // 125,
}

import 'package:ez/core/ApiClient/endpoint.dart';
import 'package:ez/core/utils/strings.dart';
import 'package:ez/features/tasklist/repository/repository.dart';
import 'package:ez/utils/helper/aes_encryption.dart';
import 'package:flutter/cupertino.dart';

class TaskListViewModel extends ChangeNotifier {
  late final TaskListRepo repo;

  TaskListViewModel(this.repo);

  bool loading = false;
  String errormessage = "";

  Future<void> getTaskList(var _data, String dynamicPath) async {
    loading = true;
    errormessage = "";

    try {
      final encryptedData =
          await repo.getData(EndPoint.getPath(method: dynamicPath), _data);
      String decryptedData = AaaEncryption.dec_base64(encryptedData);

      debugPrint("decryptedData $decryptedData");
    } catch (e) {
      errormessage = Strings.txt_error_fetchfailed;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}

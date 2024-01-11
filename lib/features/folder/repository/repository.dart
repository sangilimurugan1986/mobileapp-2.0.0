import 'package:get/get_connect/http/src/response/response.dart';

import '../../../api/api.dart';

abstract class FolderListRepo {
  Future<dynamic> getFolderData(String payload);
}

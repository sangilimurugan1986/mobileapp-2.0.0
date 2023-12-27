import 'package:get/get_connect/http/src/response/response.dart';

import '../../../api/api.dart';
import '../model/Panel.dart';

abstract class WorkflowListRepo {
  Future<dynamic> getDataList();
}

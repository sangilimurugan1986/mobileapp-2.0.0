import 'dart:convert';

import 'package:ez/controllers/repository_controller.dart';
import 'package:get/get.dart';
import '../models/option.dart';
import '../models/repository_field.dart';
import '../utils/data_type.dart';

class TicketController extends GetxController {
  final repositoryController = Get.put(RepositoryController());

  var initiateBy = 'Document';

  final isLoading = false.obs;

  var workflow = <String, dynamic>{};
  var activityId = '';
  var activeTab = 'Inbox';

  final actions = <dynamic>[].obs;
  var action = '';

  var dynamicUser = '';
  var externalUser = '';

  var workflowId = 0;
  var itemId = 0;
  var cabinetId = 0;
  var processId = 0;
  var formId = 0;
  var formEntryId = 0;
  var transactionId = 0;

  var comment = ''.obs;

  final repositoryFields = <RepositoryField>[].obs;
  final repositoryFieldsModel = <String, dynamic>{}.obs;
  final repositoryFieldOptions = <String, dynamic>{}.obs;

  // initialize

  // init repository fields model

  void initRepositoryFieldsModel() {
    if (cabinetId == 0) {
      repositoryFieldsModel.clear();
    } else {
      for (var field in repositoryFields) {
        repositoryFieldsModel[field.name] = initialValue(field.type);
      }
    }
  }

  // repository field's model initial value

  dynamic initialValue(DataType type) {
    switch (type) {
      case DataType.SingleSelect:
        return const Option(label: '', value: '');
      default:
        return '';
    }
  }

  // ...

  // init repository fields options

/*  Future initRepositoryFieldOptions() async {
    if (cabinetId == 0) {
      repositoryFieldOptions.clear();
    } else {
      for (final field in repositoryFields) {
        repositoryFieldOptions[field.name] =
            await getRepositoryFieldOptions(field);
      }
    }
  }*/

  // ...

  // get repository fields

/*  Future getRepositoryFields() async {
    if (cabinetId == 0) {
      return;
    }

    isLoading.value = true;

    repositoryFields.value =
        await repositoryController.getRepositoryFields(cabinetId.toString());

    if (initiateBy == 'Form') {
      repositoryFields.removeWhere((field) => field.name == 'Request No');
    }

    initRepositoryFieldsModel();
    await initRepositoryFieldOptions();

    isLoading.value = false;
  }*/

  // ...

  // on repository field changed

  void onRepositoryFieldChanged(dynamic value, String fieldName) {
    repositoryFieldsModel[fieldName] = value;
  }

  // ...

  // get cabinet field value

  dynamic getCabinetFieldValue(RepositoryField field) {
    switch (field.type) {
      case DataType.SingleSelect:
        if (repositoryFieldsModel[field.name].label == '') {
          return null;
        } else {
          return repositoryFieldsModel[field.name].value;
        }
      default:
        if (repositoryFieldsModel[field.name] == '') {
          return null;
        } else {
          return repositoryFieldsModel[field.name];
        }
    }
  }

  // ...

  // transform cabinet fields

  List<Map> transformCabinetFields() {
    final fields = <Map>[];
    for (var field in repositoryFields) {
      final dynamic fieldValue = getCabinetFieldValue(field);
      if (fieldValue != null) {
        fields.add(<String, dynamic>{
          'fieldName': field.name,
          'fieldValue': fieldValue,
          'type': field.typeId,
        });
      }
    }
    return fields;
  }

  // ...

  // ...

  // onComment

  void onComment(String message) {
    comment.value = message;
  }

  // ...
}

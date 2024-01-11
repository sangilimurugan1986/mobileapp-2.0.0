import 'package:ez/models/popup/controllers/popupfullpagecontroller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/auth_repo.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../../widgets/MotionToastWidget.dart';
import '../models/selectedFileUpload.dart';
import 'package:dio/dio.dart' as dii;
import 'package:http_parser/http_parser.dart' as htp;
//import 'package:mime_type/mime_type.dart';

class AttcaheFileController extends GetxController {
  final controllerpopup = Get.put(PopupFullPageController());
  int iSelecteFileCount = 0;
  //final tabitems = ['Home', 'Attachemnts', 'Comments', 'Task', 'History'];

  List dataFileListNew = <filedatas>[].obs;

  final showSelectedFiles = false.obs;
  final selectedFiles = <SelectedFileUpload>[].obs;

  int getSelectedFileCount(List dataFileListNew) {
    var filtered = dataFileListNew.where((e) => e.selected == true);
    return filtered.length;
  }

  selectedUploadedFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      this.selectedFiles.clear();

      selectedFiles.value = result.files
          .map((file) => SelectedFileUpload(
              name: file.name,
              size: formatFileSize(file.size),
              type: file.extension ?? '',
              file: file.path,
              workflowId: controllerpopup.sWorkFlowId,
              repositoryId: controllerpopup.repositoryId,
              processId: controllerpopup.sProcessId,
              transactionId: controllerpopup.sTransactionId,
              fields: ''))
          .toList();

      showSelectedFiles.value = true;

      dii.FormData formData = new dii.FormData.fromMap({
        'name': selectedFiles[0].name,
        'size': selectedFiles[0].size,
        'type': selectedFiles[0].type,
        'file': await dii.MultipartFile.fromFile(selectedFiles[0].file),
        'workflowId': controllerpopup.sWorkFlowId,
        'repositoryId': controllerpopup.repositoryId,
        'processId': controllerpopup.sProcessId,
        'transactionId': controllerpopup.sTransactionId,
        'fields': ''
      });

      final responses = await AuthRepo.postAttachment(formData);
      String dec = AaaEncryption.decryptAESaaa(responses.toString());

      final statusCode = responses.statusCode;

      if (statusCode == 200) {
        print('sucess');
        return true;
      }
      return false;
    }
  }

  String formatFileSize(int size) {
    return filesize(size);
  }

  void onUpload() {
    //showbottomup.value = false;
    selectedUploadedFiles();
    debugPrint('onFabPlus onUpload');
  }

  Future<bool> DeleteMultipleFiles(BuildContext ctx) async {
    print('DeleteMultipleFiles');
    for (int i = 0; i < dataFileListNew.length; i++) {
      filedatas fd = dataFileListNew[i];
      if (fd.selected.value) {
        final responses = await AuthRepo.postDeleteFiles(fd.repositoryId, fd.id.toString());
        if (AaaEncryption.decryptAESaaa(responses.toString()) == 'success')
          MotionToastWidget().displaySuccessMotionToast('File Deleted Sucessfully.', ctx);
        else
          MotionToastWidget().displayErrorMotionToast('!File Not Deleted.', ctx);
      }
    }

    return true;
  }

/*  Future Uploadimage(BuildContext context, String entryType, String mode) async {
    FormData fd = new FormData({
      'workflowId': controllerpopup.sWorkFlowId,
      'repositoryId': controllerpopup.repositoryId,
      'processId': controllerpopup.sProcessId,
      'transactionId': controllerpopup.sTransactionId,
      'fields': '',
      'filename': ''
    });
  }*/
}

class filedatas {
  int id = 0;
  String name = '';
  String repositoryId = '';
  String description = '';
  String Status = '';
  String createdByEmail = '';
  String createdAt = '';
  RxBool selected = false.obs;

  filedatas(this.id, this.name, this.repositoryId, this.Status, this.description, this.selected,
      this.createdByEmail, this.createdAt);

  filedatas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    repositoryId = json['repositoryId'].toString();
    description = json['repository'];
    createdByEmail = json['createdByEmail'];
    createdAt = json['createdAt'];
    Status = 'UPLOADED'; //json['comments'];
    selected.value = false;
  }
}

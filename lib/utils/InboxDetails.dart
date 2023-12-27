class InboxDetails {
  final String requestNo;
  final String stage, raisedAt, raisedBy;
  final dynamic lastAction;
  final int processId;
  final int formId;
  final int formEntryId;
  final String activityId;
  final String transaction_createdAt;
  final int transactionId;

  final bool bread;

  InboxDetails(
      {required this.requestNo,
      required this.stage,
      required this.raisedAt,
      required this.transaction_createdAt,
      required this.raisedBy,
      required this.lastAction,
      required this.processId,
      required this.formEntryId,
      required this.formId,
      required this.activityId,
      required this.transactionId,
      required this.bread});

  factory InboxDetails.fromJson(Map<String, dynamic> json) {
/*    print('ffffffffffffffffffff');
    print(json['formData']['formId'].toString());*/
    return new InboxDetails(
        requestNo: json['requestNo'],
        stage: json['stage'],
        raisedAt: json['raisedAt'],
        raisedBy: json['raisedBy'],
        transaction_createdAt: json['transaction_createdAt'],
        lastAction: json['lastAction'],
        processId: json['processId'],
        formEntryId: json['formData']['formEntryId'],
        activityId: json['activityId'],
        transactionId: json['transactionId'], //transactionId
        formId: json['formData']['formId'], //widget.formdatas['formJson']
        //bread: json['read']);
        bread: true);
  }
}

import 'package:ez/core/CustomAppBar.dart';
import 'package:ez/core/CustomColors.dart';
import 'package:flutter/material.dart';

class TaskCreate extends StatefulWidget {
  const TaskCreate({Key? key}) : super(key: key);

  @override
  State<TaskCreate> createState() => _TaskCreateState();
}

class _TaskCreateState extends State<TaskCreate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [],
        backgroundColor: CustomColors.white,
        title: '',
      ),
      body: Container(
        child: Text("This is a Task Creation screen"),
      ),
    );
  }
}

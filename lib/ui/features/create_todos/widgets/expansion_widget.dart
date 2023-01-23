// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/constants/app_color.dart';

class ExpansionWidget extends StatefulWidget {
  const ExpansionWidget({super.key});

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  final List<ExpansionPanelData> _data = [
    ExpansionPanelData(header: 'Header 1', body: 'Body 1', isExpanded: false),
    ExpansionPanelData(header: 'Header 2', body: 'Body 2', isExpanded: false),
    ExpansionPanelData(header: 'Header 3', body: 'Body 3', isExpanded: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: List.generate(_data.length, (int index) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(_data[index].header),
            );
          },
          body: Container(
            color: AppColor.warning,
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: Text(_data[index].body),
          ),
          isExpanded: _data[index].isExpanded,
        );
      }),
    );
  }
}

class ExpansionPanelData {
  String header;
  String body;
  bool isExpanded;
  ExpansionPanelData({
    required this.header,
    required this.body,
    required this.isExpanded,
  });
}

import '/flutter_flow/flutter_flow_util.dart';
import 'cover_page_widget.dart' show StartView;
import 'package:flutter/material.dart';

class CoverPageModel extends FlutterFlowModel<StartView> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

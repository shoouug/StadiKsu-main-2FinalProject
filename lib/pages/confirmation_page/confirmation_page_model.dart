import '/flutter_flow/flutter_flow_util.dart';
import 'confirmation_page_widget.dart' show ConfirmationView;
import 'package:flutter/material.dart';

class ConfirmationPageModel extends FlutterFlowModel<ConfirmationView> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

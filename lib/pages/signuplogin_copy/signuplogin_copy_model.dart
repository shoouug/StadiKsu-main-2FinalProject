import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'signuplogin_copy_widget.dart' show SignupSigninView;
import 'package:flutter/material.dart';

class SignuploginCopyModel extends FlutterFlowModel<SignupSigninView> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode1;
  TextEditingController? emailAddressCreateController1;
  String? Function(BuildContext, String?)?
      emailAddressCreateController1Validator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode2;
  TextEditingController? emailAddressCreateController2;
  String? Function(BuildContext, String?)?
      emailAddressCreateController2Validator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordCreateVisibility = false;
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    emailAddressCreateFocusNode1?.dispose();
    emailAddressCreateController1?.dispose();

    emailAddressCreateFocusNode2?.dispose();
    emailAddressCreateController2?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmController?.dispose();
  }
}

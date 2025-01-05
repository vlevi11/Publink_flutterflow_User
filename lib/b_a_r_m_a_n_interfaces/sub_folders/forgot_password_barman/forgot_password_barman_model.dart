import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_barman_widget.dart' show ForgotPasswordBarmanWidget;
import 'package:flutter/material.dart';

class ForgotPasswordBarmanModel
    extends FlutterFlowModel<ForgotPasswordBarmanWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}

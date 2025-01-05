import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_user_widget.dart' show ForgotPasswordUserWidget;
import 'package:flutter/material.dart';

class ForgotPasswordUserModel
    extends FlutterFlowModel<ForgotPasswordUserWidget> {
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

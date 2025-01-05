import '/custom_components/gradient_card/gradient_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bar_details_proba1_widget.dart' show BarDetailsProba1Widget;
import 'package:flutter/material.dart';

class BarDetailsProba1Model extends FlutterFlowModel<BarDetailsProba1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Gradient_Card component.
  late GradientCardModel gradientCardModel;

  @override
  void initState(BuildContext context) {
    gradientCardModel = createModel(context, () => GradientCardModel());
  }

  @override
  void dispose() {
    gradientCardModel.dispose();
  }
}

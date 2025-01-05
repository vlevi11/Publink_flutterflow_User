import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'images_barman_model.dart';
export 'images_barman_model.dart';

class ImagesBarmanWidget extends StatefulWidget {
  const ImagesBarmanWidget({super.key});

  @override
  State<ImagesBarmanWidget> createState() => _ImagesBarmanWidgetState();
}

class _ImagesBarmanWidgetState extends State<ImagesBarmanWidget> {
  late ImagesBarmanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImagesBarmanModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.arrow_back_ios,
            color: FlutterFlowTheme.of(context).alternate,
            size: 24.0,
          ),
          title: Text(
            'Képek',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Inter Tight',
                  color: FlutterFlowTheme.of(context).alternate,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    itemCount: 5,
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      10.0,
                      0,
                      10.0,
                    ),
                    itemBuilder: (context, index) {
                      return [
                        () => Container(
                              width: 100.0,
                              height: 248.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                        () => Container(
                              width: 100.0,
                              height: 196.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                        () => Container(
                              width: 100.0,
                              height: 189.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                        () => Container(
                              width: 100.0,
                              height: 93.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                        () => Container(
                              width: 100.0,
                              height: 147.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                      ][index]();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

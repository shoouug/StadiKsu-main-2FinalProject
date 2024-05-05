import 'package:stadi_k_s_u/app_router.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'cover_page_model.dart';
export 'cover_page_model.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  late CoverPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoverPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          context.go(AppRouter.kSignupSigninView);
                        },
                        child: Align(
                          alignment: const AlignmentDirectional(-0.02, 0.8),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 44.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                context.go(AppRouter.kSignupSigninView);
                              },
                              text: 'Register',
                              options: FFButtonOptions(
                                width: 270.0,
                                height: 50.0,
                                color: const Color(0xFF64A5BD),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.08, -0.63),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/StadKSU.PNG',
                            width: 300.0,
                            height: 580.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: const AlignmentDirectional(-0.39, 0.68),
                      //   child: Text(
                      //     'Already have an account? ',
                      //     style:
                      //         FlutterFlowTheme.of(context).labelMedium.override(
                      //               fontFamily: 'Readex Pro',
                      //               letterSpacing: 0.0,
                      //             ),
                      //   ),
                      // ),
                      // Align(
                      //   alignment: const AlignmentDirectional(0.4, 0.68),
                      //   child: InkWell(
                      //     onTap: () {
                      //       context.go(AppRouter.kSignupSigninView);
                      //     },
                      //     child: Text(
                      //       'log in ',
                      //       style: FlutterFlowTheme.of(context)
                      //           .labelMedium
                      //           .override(
                      //             fontFamily: 'Readex Pro',
                      //             color: const Color(0xFF64A5BD),
                      //             letterSpacing: 0.0,
                      //           ),
                      //     ),
                      //   ),
                      // ),
                      // Align(
                      //   alignment: const AlignmentDirectional(-0.39, 0.68),
                      //   child: Text(
                      //     'Already have an account? ',
                      //     style:
                      //         FlutterFlowTheme.of(context).labelMedium.override(
                      //               fontFamily: 'Readex Pro',
                      //               letterSpacing: 0.0,
                      //             ),
                      //   ),
                      // ),
                      Align(
                        alignment: const AlignmentDirectional(-0.07, 0.04),
                        child: Text(
                          'Unlock the Doors to College Stadiums with Ease !',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// context.go(AppRouter.kSignupSigninView);
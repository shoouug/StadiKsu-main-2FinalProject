import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/stadium_model.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'reservationinfo_model.dart';
export 'reservationinfo_model.dart';

class StadiumInfoView extends StatefulWidget {
  const StadiumInfoView({super.key, required this.stadium});
  final StadiumModel stadium;

  @override
  State<StadiumInfoView> createState() => _StadiumInfoViewState();
}

class _StadiumInfoViewState extends State<StadiumInfoView> {
  late ReservationinfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReservationinfoModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF64A5BD),
                size: 30.0,
              ),
            ),
            title: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Text(
                      '      ${widget.stadium.name}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF64A5BD),
                            fontSize: 25.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            elevation: 4.0,
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 313.0,
                          child: Stack(
                            children: [
                              Image.network(
                                widget.stadium.imgURL,
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                              // Align(
                              //   alignment:
                              //       const AlignmentDirectional(-1.0, 1.0),
                              //   child: Padding(
                              //     padding: const EdgeInsetsDirectional.fromSTEB(
                              //         16.0, 0.0, 0.0, 16.0),
                              //     child:
                              //         smooth_page_indicator.SmoothPageIndicator(
                              //       controller: _model.pageViewController ??=
                              //           PageController(initialPage: 0),
                              //       count: 3,
                              //       axisDirection: Axis.horizontal,
                              //       onDotClicked: (i) async {
                              //         await _model.pageViewController!
                              //             .animateToPage(
                              //           i,
                              //           duration:
                              //               const Duration(milliseconds: 500),
                              //           curve: Curves.ease,
                              //         );
                              //       },
                              //       effect: const smooth_page_indicator
                              //           .ExpandingDotsEffect(
                              //         expansionFactor: 3.0,
                              //         spacing: 8.0,
                              //         radius: 16.0,
                              //         dotWidth: 16.0,
                              //         dotHeight: 8.0,
                              //         dotColor: Color(0xBDB2D6E4),
                              //         activeDotColor: Color(0xFF9CBAC7),
                              //         paintStyle: PaintingStyle.fill,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 9.0),
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFFBDD1DC),
                                size: 24.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                ' Stadium No:   ',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Text(
                                widget.stadium?.stNo == null
                                    ? ''
                                    : widget.stadium!.stNo,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          child: Icon(
                            Icons.people_outline_sharp,
                            color: Color(0xFFBDD1DC),
                            size: 24.0,
                          ),
                        ),
                        Text(
                          ' Capacity:   ',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: Text(
                            widget.stadium?.capacity == null
                                ? ''
                                : widget.stadium!.capacity.toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  context.push(
                    AppRouter.kBookReservationView,
                    extra: widget.stadium,
                  );
                },
                child: Align(
                  alignment: const AlignmentDirectional(0.01, 0.4),
                  child: Container(
                    width: 160.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD1E8F3),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'avalibale slots',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
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

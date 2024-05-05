import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/my_fire_base.dart';
import 'package:stadi_k_s_u/stadium_item.dart';
import 'package:stadi_k_s_u/pages/reservationinfo/reservationinfo_widget.dart';
import 'package:stadi_k_s_u/stadium_model.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  static List<StadiumModel> stadiums = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
    getStadiums();
  }

  getStadiums() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('Stadium').get();
    List<Map<String, dynamic>> data =
        querySnapshot.docs.map((e) => e.data()).toList();
    setState(() {});
    stadiums = data.map((e) => StadiumModel.fromJson(e)).toList();
    print('stadiums: $stadiums');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 24.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Welcome',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Barlow',
                      color: const Color(0xFF2589A3),
                      fontSize: 27.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Opacity(
                opacity: 0.7,
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).info,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: Colors.white,
                  icon: const Icon(
                    Icons.notifications_active_rounded,
                    color: Color(0xFF2589A3),
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Text(
            'Book a stadium for your event easily !',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Barlow',
                  color: const Color(0xFF124252),
                  fontSize: 17.0,
                  letterSpacing: 0.0,
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.white,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 27.0,
                fillColor: Colors.white,
                icon: const Icon(
                  Icons.location_pin,
                  color: Color(0xFF2589A3),
                  size: 18.0,
                ),
                onPressed: () {},
              ),
              Text(
                'Collage of Computer and Information Science',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Barlow',
                      color: const Color(0xFF64A5BD),
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: 350.0,
            height: 514.0,
            child: stadiums.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: stadiums.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () => context.push(
                                AppRouter.kStadiumInfoView,
                                extra: stadiums[index],
                              ),
                          child: StadiumItem(
                            stadium: stadiums[index],
                          ));
                    }),
            // ListView(
            //   children: [
            //     const ReservationItem(),
            //     Container(
            //       width: 100.0,
            //       height: 100.0,
            //       decoration: const BoxDecoration(
            //         color: Color(0xFFDBEAF2),
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(8.0),
            //           bottomRight: Radius.circular(8.0),
            //           topLeft: Radius.circular(8.0),
            //           topRight: Radius.circular(8.0),
            //         ),
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Row(
            //             mainAxisSize: MainAxisSize.max,
            //             children: [
            //               Container(
            //                 width: 100.0,
            //                 height: 100.0,
            //                 decoration: BoxDecoration(
            //                   color: FlutterFlowTheme.of(context)
            //                       .secondaryBackground,
            //                 ),
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(8.0),
            //                   child: Image.asset(
            //                     'assets/images/photo_2024-03-26_13-31-01.jpg',
            //                     width: 300.0,
            //                     height: 200.0,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           InkWell(
            //             onTap: () {
            //               GoRouter.of(context)
            //                   .push(AppRouter.kReservationInfoView);
            //             },
            //             child: Align(
            //               alignment: const AlignmentDirectional(-1.0, -1.0),
            //               child: Padding(
            //                 padding: const EdgeInsetsDirectional.fromSTEB(
            //                     14.0, 20.0, 0.0, 0.0),
            //                 child: Text(
            //                   'Khadijah Stadium\nAvailable',
            //                   style: FlutterFlowTheme.of(context)
            //                       .bodyMedium
            //                       .override(
            //                         fontFamily: 'Readex Pro',
            //                         color: const Color(0xFF207E63),
            //                         letterSpacing: 0.0,
            //                       ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: 100.0,
            //       height: 100.0,
            //       decoration: const BoxDecoration(
            //         color: Color(0xFFDBEAF2),
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(8.0),
            //           bottomRight: Radius.circular(8.0),
            //           topLeft: Radius.circular(8.0),
            //           topRight: Radius.circular(8.0),
            //         ),
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Row(
            //             mainAxisSize: MainAxisSize.max,
            //             children: [
            //               Container(
            //                 width: 100.0,
            //                 height: 100.0,
            //                 decoration: BoxDecoration(
            //                   color: FlutterFlowTheme.of(context)
            //                       .secondaryBackground,
            //                 ),
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(8.0),
            //                   child: Image.asset(
            //                     'assets/images/photo_2024-03-26_13-31-02.jpg',
            //                     width: 300.0,
            //                     height: 200.0,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           InkWell(
            //             onTap: () {
            //               GoRouter.of(context)
            //                   .push(AppRouter.kReservationInfoView);
            //             },
            //             child: Align(
            //               alignment: const AlignmentDirectional(-1.0, -1.0),
            //               child: Padding(
            //                 padding: const EdgeInsetsDirectional.fromSTEB(
            //                     14.0, 20.0, 0.0, 0.0),
            //                 child: Text(
            //                   'Main Stadium\nAvailable',
            //                   style: FlutterFlowTheme.of(context)
            //                       .bodyMedium
            //                       .override(
            //                         fontFamily: 'Readex Pro',
            //                         color: const Color(0xFF207E63),
            //                         letterSpacing: 0.0,
            //                       ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: 100.0,
            //       height: 100.0,
            //       decoration: const BoxDecoration(
            //         color: Color(0xFFDBEAF2),
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(8.0),
            //           bottomRight: Radius.circular(8.0),
            //           topLeft: Radius.circular(8.0),
            //           topRight: Radius.circular(8.0),
            //         ),
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         children: [
            //           Row(
            //             mainAxisSize: MainAxisSize.max,
            //             children: [
            //               Container(
            //                 width: 100.0,
            //                 height: 100.0,
            //                 decoration: BoxDecoration(
            //                   color: FlutterFlowTheme.of(context)
            //                       .secondaryBackground,
            //                 ),
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(8.0),
            //                   child: Image.asset(
            //                     'assets/images/photo_2024-03-26_13-31-03.jpg',
            //                     width: 300.0,
            //                     height: 200.0,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           InkWell(
            //             onTap: () {
            //               GoRouter.of(context)
            //                   .push(AppRouter.kReservationInfoView);
            //             },
            //             child: Align(
            //               alignment: const AlignmentDirectional(-1.0, -1.0),
            //               child: Padding(
            //                 padding: const EdgeInsetsDirectional.fromSTEB(
            //                     14.0, 20.0, 0.0, 0.0),
            //                 child: Text(
            //                   'Mariyah Stadium\nAvailable',
            //                   style: FlutterFlowTheme.of(context)
            //                       .bodyMedium
            //                       .override(
            //                         fontFamily: 'Readex Pro',
            //                         color: const Color(0xFF207E63),
            //                         letterSpacing: 0.0,
            //                       ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ].divide(const SizedBox(height: 10.0)),
            // ),
          ),
        ],
      ),
    );
  }
}

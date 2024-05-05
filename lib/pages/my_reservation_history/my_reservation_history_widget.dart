import 'package:firebase_auth/firebase_auth.dart';
import 'package:stadi_k_s_u/reservation_item.dart';
import 'package:stadi_k_s_u/reservation_model.dart';
import 'package:stadi_k_s_u/stadium_item.dart';

import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'my_reservation_history_model.dart';
export 'my_reservation_history_model.dart';

class MyReservationView extends StatefulWidget {
  const MyReservationView({super.key});

  @override
  State<MyReservationView> createState() => _MyReservationViewState();
}

class _MyReservationViewState extends State<MyReservationView> {
  late MyReservationHistoryModel _model;
  TextEditingController searchController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<ReservationModel> reservations = [];
  List<ReservationModel> reservationsSearch = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyReservationHistoryModel());

    _model.textFieldFocusNode ??= FocusNode();
    _getReservationData();
  }

  _getReservationData() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Reservations')
          .where('UserID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      List<Map<String, dynamic>> data =
          querySnapshot.docs.map((e) => e.data()).toList();
      setState(() {});
      reservations = data.map((e) => ReservationModel.fromJson(e)).toList();
      print('reservations: $reservations');
    } catch (e) {
      print(e.toString());
    }
  }

  List<ReservationModel> searchReservation(String query) {
    List<ReservationModel> reservationsSearch = reservations
        .where((reservation) => reservation.reservationId
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
    return reservationsSearch;
  }

  @override
  void dispose() {
    _model.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (query) {
                  setState(() {});
                  reservationsSearch = searchReservation(query);
                },
                controller: searchController,
                focusNode: _model.textFieldFocusNode,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: false,
                  labelText: 'Search for reservation ...',
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                maxLines: null,
                minLines: null,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(1.0, 30.0, 1.0, 12.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).info,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).info,
                    width: 1.0,
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowChoiceChips(
                              options: const [
                                ChipData('Reservations'),
                                // ChipData('History\n')
                              ],
                              onChanged: (val) => setState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: const Color(0xFFB0D6E5),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor: const Color(0xFFB0D6E5),
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              chipSpacing: 55.0,
                              rowSpacing: 12.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['History\n'],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Container(
                width: double.maxFinite,
                height: 560.0,
                decoration: BoxDecoration(
                  color: const Color(0xC4B0D6E5),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      22.0, 22.0, 22.0, 0.0),
                  child: reservations.isEmpty
                      ? Center(
                          child: Text(
                          textAlign: TextAlign.center,
                          'There are no reservations yet.',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ))
                      : ListView.builder(
                          itemCount: searchController.text.isNotEmpty
                              ? reservationsSearch.length
                              : reservations.length,
                          itemBuilder: (context, index) => ReservationItem(
                            reservation: searchController.text.isNotEmpty
                                ? reservationsSearch[index]
                                : reservations[index],
                          ),
                        ),

                  // ListView(
                  //   padding: EdgeInsets.zero,
                  //   scrollDirection: Axis.vertical,
                  //   children: [
                  //     Container(
                  //       width: 100.0,
                  //       height: 100.0,
                  //       decoration: BoxDecoration(
                  //         color: FlutterFlowTheme.of(context).secondary,
                  //         borderRadius: const BorderRadius.only(
                  //           bottomLeft: Radius.circular(8.0),
                  //           bottomRight: Radius.circular(8.0),
                  //           topLeft: Radius.circular(8.0),
                  //           topRight: Radius.circular(8.0),
                  //         ),
                  //       ),
                  //       child: Container(
                  //         width: 100.0,
                  //         height: 100.0,
                  //         decoration: BoxDecoration(
                  //           color: FlutterFlowTheme.of(context)
                  //               .secondaryBackground,
                  //           borderRadius: const BorderRadius.only(
                  //             bottomLeft: Radius.circular(8.0),
                  //             bottomRight: Radius.circular(8.0),
                  //             topLeft: Radius.circular(8.0),
                  //             topRight: Radius.circular(8.0),
                  //           ),
                  //         ),
                  //         child: Row(
                  //           mainAxisSize: MainAxisSize.max,
                  //           children: [
                  //             Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               children: [
                  //                 Container(
                  //                   width: 100.0,
                  //                   height: 100.0,
                  //                   decoration: BoxDecoration(
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .secondaryBackground,
                  //                   ),
                  //                   child: ClipRRect(
                  //                     borderRadius: BorderRadius.circular(8.0),
                  //                     child: Image.asset(
                  //                       'assets/images/photo_2024-03-26_13-31-05.jpg',
                  //                       width: 300.0,
                  //                       height: 200.0,
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Align(
                  //               alignment:
                  //                   const AlignmentDirectional(-1.0, -1.0),
                  //               child: Padding(
                  //                 padding: const EdgeInsetsDirectional.fromSTEB(
                  //                     14.0, 20.0, 0.0, 0.0),
                  //                 child: Text(
                  //                   'Mariyah Stadium\n22/2/2024\n6G46',
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
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 100.0,
                  //       height: 100.0,
                  //       decoration: BoxDecoration(
                  //         color:
                  //             FlutterFlowTheme.of(context).secondaryBackground,
                  //         borderRadius: const BorderRadius.only(
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
                  //           Align(
                  //             alignment: const AlignmentDirectional(-1.0, -1.0),
                  //             child: Padding(
                  //               padding: const EdgeInsetsDirectional.fromSTEB(
                  //                   14.0, 20.0, 0.0, 0.0),
                  //               child: Text(
                  //                 'Khadijah Stadium\n3/1/2024\n6G41',
                  //                 style: FlutterFlowTheme.of(context)
                  //                     .bodyMedium
                  //                     .override(
                  //                       fontFamily: 'Readex Pro',
                  //                       color: const Color(0xFF207E63),
                  //                       letterSpacing: 0.0,
                  //                     ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       width: 100.0,
                  //       height: 100.0,
                  //       decoration: BoxDecoration(
                  //         color: FlutterFlowTheme.of(context).primaryBackground,
                  //         borderRadius: const BorderRadius.only(
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
                  //                 child: Align(
                  //                   alignment:
                  //                       const AlignmentDirectional(0.0, 0.0),
                  //                   child: ClipRRect(
                  //                     borderRadius: BorderRadius.circular(8.0),
                  //                     child: Image.asset(
                  //                       'assets/images/photo_2024-03-26_13-30-43.jpg',
                  //                       width: 300.0,
                  //                       height: 200.0,
                  //                       fit: BoxFit.cover,
                  //                       alignment: const Alignment(0.0, -1.0),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           Align(
                  //             alignment: const AlignmentDirectional(-1.0, -1.0),
                  //             child: Padding(
                  //               padding: const EdgeInsetsDirectional.fromSTEB(
                  //                   14.0, 20.0, 0.0, 0.0),
                  //               child: Text(
                  //                 'The Main Stadium\n5/22/2023\n6G46\n',
                  //                 style: FlutterFlowTheme.of(context)
                  //                     .bodyMedium
                  //                     .override(
                  //                       fontFamily: 'Readex Pro',
                  //                       color: const Color(0xFF207E63),
                  //                       letterSpacing: 0.0,
                  //                     ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ].divide(const SizedBox(height: 22.0)),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

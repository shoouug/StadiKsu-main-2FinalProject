import 'package:firebase_auth/firebase_auth.dart';
import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/edit_reservation_item.dart';
import 'package:stadi_k_s_u/reservation_model.dart';

import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'my_reservation_model.dart';
export 'my_reservation_model.dart';

class EditBookedReservationView extends StatefulWidget {
  const EditBookedReservationView({super.key});

  @override
  State<EditBookedReservationView> createState() =>
      _EditBookedReservationViewState();
}

class _EditBookedReservationViewState extends State<EditBookedReservationView> {
  late MyReservationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<ReservationModel>? reservations;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyReservationModel());

    _model.textController ??= TextEditingController();
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF64A5BD),
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'My Reservations',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Outfit',
                  color: const Color(0xFF64A5BD),
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 60),
            // Padding(
            //   padding:
            //       const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
            //   child: TextFormField(
            //     controller: _model.textController,
            //     focusNode: _model.textFieldFocusNode,
            //     obscureText: false,
            //     decoration: InputDecoration(
            //       isDense: false,
            //       labelText: 'Search for reservation ...',
            //       labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
            //             fontFamily: 'Readex Pro',
            //             letterSpacing: 0.0,
            //           ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: FlutterFlowTheme.of(context).primaryBackground,
            //           width: 2.0,
            //         ),
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: FlutterFlowTheme.of(context).primary,
            //           width: 2.0,
            //         ),
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //       errorBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: FlutterFlowTheme.of(context).error,
            //           width: 2.0,
            //         ),
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //       focusedErrorBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: FlutterFlowTheme.of(context).error,
            //           width: 2.0,
            //         ),
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //       filled: true,
            //       fillColor: FlutterFlowTheme.of(context).primaryBackground,
            //       prefixIcon: Icon(
            //         Icons.search_outlined,
            //         color: FlutterFlowTheme.of(context).secondaryText,
            //       ),
            //     ),
            //     style: FlutterFlowTheme.of(context).bodyMedium.override(
            //           fontFamily: 'Readex Pro',
            //           letterSpacing: 0.0,
            //         ),
            //     maxLines: null,
            //     minLines: null,
            //     validator: _model.textControllerValidator.asValidator(context),
            //   ),
            // ),
            // Padding(
            //   padding:
            //       const EdgeInsetsDirectional.fromSTEB(1.0, 30.0, 1.0, 12.0),
            //   child: Container(
            //     width: double.infinity,
            //     constraints: const BoxConstraints(
            //       maxWidth: double.infinity,
            //     ),
            //     decoration: BoxDecoration(
            //       color: FlutterFlowTheme.of(context).info,
            //       borderRadius: BorderRadius.circular(8.0),
            //       border: Border.all(
            //         color: FlutterFlowTheme.of(context).info,
            //         width: 1.0,
            //       ),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsetsDirectional.fromSTEB(
            //           16.0, 12.0, 16.0, 12.0),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Flexible(
            //             child: Align(
            //               alignment: const AlignmentDirectional(0.0, 0.0),
            //               child: FlutterFlowChoiceChips(
            //                 options: const [
            //                   ChipData('Reservations'),
            //                   // ChipData('History\n')
            //                 ],
            //                 onChanged: (val) => setState(() =>
            //                     _model.choiceChipsValue = val?.firstOrNull),
            //                 selectedChipStyle: ChipStyle(
            //                   backgroundColor: const Color(0xFFB0D6E5),
            //                   textStyle: FlutterFlowTheme.of(context)
            //                       .bodyMedium
            //                       .override(
            //                         fontFamily: 'Readex Pro',
            //                         color: FlutterFlowTheme.of(context)
            //                             .primaryText,
            //                         letterSpacing: 0.0,
            //                       ),
            //                   iconColor:
            //                       FlutterFlowTheme.of(context).primaryText,
            //                   iconSize: 18.0,
            //                   elevation: 0.0,
            //                   borderColor: const Color(0xFFB0D6E5),
            //                   borderWidth: 1.0,
            //                   borderRadius: BorderRadius.circular(8.0),
            //                 ),
            //                 unselectedChipStyle: ChipStyle(
            //                   backgroundColor: FlutterFlowTheme.of(context)
            //                       .primaryBackground,
            //                   textStyle: FlutterFlowTheme.of(context)
            //                       .bodyMedium
            //                       .override(
            //                         fontFamily: 'Readex Pro',
            //                         color: FlutterFlowTheme.of(context)
            //                             .secondaryText,
            //                         letterSpacing: 0.0,
            //                       ),
            //                   iconColor:
            //                       FlutterFlowTheme.of(context).secondaryText,
            //                   iconSize: 18.0,
            //                   elevation: 0.0,
            //                   borderColor:
            //                       FlutterFlowTheme.of(context).alternate,
            //                   borderWidth: 1.0,
            //                   borderRadius: BorderRadius.circular(8.0),
            //                 ),
            //                 chipSpacing: 55.0,
            //                 rowSpacing: 12.0,
            //                 multiselect: false,
            //                 initialized: _model.choiceChipsValue != null,
            //                 alignment: WrapAlignment.start,
            //                 controller: _model.choiceChipsValueController ??=
            //                     FormFieldController<List<String>>(
            //                   ['Reservations'],
            //                 ),
            //                 wrapped: true,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Opacity(
              opacity: 0.9,
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 9.0, 0.0),
                child: Container(
                  width: 391.0,
                  height: 600,
                  decoration: BoxDecoration(
                    color: const Color(0xC4B0D6E5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        22.0, 22.0, 22.0, 0.0),
                    child: reservations == null
                        ? const Center(child: CircularProgressIndicator())
                        : reservations!.isEmpty
                            ? Center(
                                child: Text(
                                textAlign: TextAlign.center,
                                'There are no reservations yet.',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ))
                            : ListView.builder(
                                itemCount: reservations!.length,
                                itemBuilder: (context, index) =>
                                    EditReservationItem(
                                  reservation: reservations![index],
                                ),
                              ),
                    // ListView(
                    //   padding: EdgeInsets.zero,
                    //   scrollDirection: Axis.vertical,
                    //   children: [
                    //     const EditReservationItem(),
                    //     Container(
                    //       width: 100.0,
                    //       height: 100.0,
                    //       decoration: BoxDecoration(
                    //         color: FlutterFlowTheme.of(context)
                    //             .secondaryBackground,
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
                    //               Row(
                    //                 mainAxisSize: MainAxisSize.max,
                    //                 children: [
                    //                   Container(
                    //                     width: 100.0,
                    //                     height: 100.0,
                    //                     decoration: BoxDecoration(
                    //                       color: FlutterFlowTheme.of(context)
                    //                           .secondaryBackground,
                    //                     ),
                    //                     child: ClipRRect(
                    //                       borderRadius:
                    //                           BorderRadius.circular(8.0),
                    //                       child: Image.asset(
                    //                         'assets/images/photo_2024-03-26_13-31-01.jpg',
                    //                         width: 300.0,
                    //                         height: 200.0,
                    //                         fit: BoxFit.cover,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               Align(
                    //                 alignment:
                    //                     const AlignmentDirectional(-1.0, -1.0),
                    //                 child: Padding(
                    //                   padding:
                    //                       const EdgeInsetsDirectional.fromSTEB(
                    //                           14.0, 20.0, 75.0, 0.0),
                    //                   child: Text(
                    //                     'Khadijah Stadium\n23/5/2024\n6G41',
                    //                     style: FlutterFlowTheme.of(context)
                    //                         .bodyMedium
                    //                         .override(
                    //                           fontFamily: 'Readex Pro',
                    //                           color: const Color(0xFF207E63),
                    //                           letterSpacing: 0.0,
                    //                         ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           Column(
                    //             mainAxisSize: MainAxisSize.max,
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceEvenly,
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               Icon(
                    //                 Icons.edit_calendar,
                    //                 color: FlutterFlowTheme.of(context)
                    //                     .secondaryText,
                    //                 size: 24.0,
                    //               ),
                    //               const Icon(
                    //                 Icons.delete_outlined,
                    //                 color: Color(0xFFB21B25),
                    //                 size: 24.0,
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ].divide(const SizedBox(height: 22.0)),
                    // ),
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

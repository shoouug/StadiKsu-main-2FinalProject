import 'package:firebase_auth/firebase_auth.dart';
import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/reservation_model.dart';
import 'package:stadi_k_s_u/stadium_model.dart';
import 'package:uuid/uuid.dart';

import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'reservations_pagefinal_edit_model.dart';
export 'reservations_pagefinal_edit_model.dart';

class BookReservationView extends StatefulWidget {
  const BookReservationView({super.key, required this.stadium});
  final StadiumModel stadium;

  @override
  State<BookReservationView> createState() => _BookReservationViewState();
}

class _BookReservationViewState extends State<BookReservationView> {
  late ReservationsPagefinalEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectesDTString;
  String? time;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReservationsPagefinalEditModel());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.white),
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
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
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Stack(
            //   children: [
            //     Align(
            //       alignment: const AlignmentDirectional(-0.8, 0.57),
            //       child: FlutterFlowDropDown<String>(
            //         controller: _model.dropDownValueController ??=
            //             FormFieldController<String>(null),
            //         options: const [
            //           'Mariyah Stadium',
            //           'Khadijah Stadium ',
            //           'University Stadium'
            //         ],
            //         onChanged: (val) =>
            //             setState(() => _model.dropDownValue = val),
            //         width: 204.0,
            //         height: 48.0,
            //         textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            //               fontFamily: 'Readex Pro',
            //               color: const Color(0xFF124252),
            //               letterSpacing: 0.0,
            //             ),
            //         hintText: 'Mariyah Stadium',
            //         icon: Icon(
            //           Icons.keyboard_arrow_down_rounded,
            //           color: FlutterFlowTheme.of(context).secondaryText,
            //           size: 24.0,
            //         ),
            //         fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            //         elevation: 2.0,
            //         borderColor: FlutterFlowTheme.of(context).alternate,
            //         borderWidth: 2.0,
            //         borderRadius: 8.0,
            //         margin: const EdgeInsetsDirectional.fromSTEB(
            //             16.0, 0.0, 16.0, 4.0),
            //         hidesUnderline: true,
            //         isOverButton: true,
            //         isSearchable: false,
            //         isMultiSelect: false,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 30),
            Container(
              width: 414.0,
              height: 746.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Stack(
                children: [
                  Wrap(
                    spacing: 0.0,
                    runSpacing: 0.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 20.0, 27.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  2.0,
                                  0.0,
                                ),
                                spreadRadius: 5.0,
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowCalendar(
                                  color: const Color(0xFFB0D6E5),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  weekFormat: false,
                                  weekStartsMonday: true,
                                  rowHeight: 50.0,
                                  onChange: (DateTimeRange? newSelectedDate) {
                                    setState(() {});
                                    _model.calendarSelectedDay =
                                        newSelectedDate;
                                    DateTime selectedDate =
                                        newSelectedDate!.start;
                                    if (newSelectedDate.start <
                                        DateTime.now().subtract(
                                            const Duration(days: 1))) {
                                      showSnackbar(context, 'Invalid Date');
                                      return;
                                    }
                                    selectesDTString =
                                        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
                                  },
                                  titleStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                  dayOfWeekStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  dateStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  selectedDateStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                  inactiveDateStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.03, 0.71),
                        child: Text(
                          'Select a time:',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.96, 0.24),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 0.0, 30.0),
                      child: FlutterFlowChoiceChips(
                        options: const [ChipData('9:00 - 10:00')],
                        onChanged: (val) {
                          setState(() {});
                          _model.choiceChipsValue1 = val?.firstOrNull;
                          time = '9:00 am - 10:00 am';
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 0.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController1 ??=
                            FormFieldController<List<String>>([]),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.05, 0.24),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 0.0, 10.0, 30.0),
                      child: FlutterFlowChoiceChips(
                        options: const [ChipData('11:00 - 12:00')],
                        onChanged: (val) => setState(() {
                          _model.choiceChipsValue2 = val?.firstOrNull;
                          time = '11:00 am - 12:00 pm';
                        }),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: const Color(0xFFBEC1CA),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 0.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController2 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.8, 0.38),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 20.0, 30.0),
                      child: FlutterFlowChoiceChips(
                        options: const [ChipData('1:00 - 2:00')],
                        onChanged: (val) => setState(() {
                          _model.choiceChipsValue2 = val?.firstOrNull;
                          time = '1:00 pm - 2:00 pm';
                        }),
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryText,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 0.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController3 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.86, 0.25),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 20.0, 31.0),
                      child: FlutterFlowChoiceChips(
                        options: const [ChipData('12:00 - 1:00')],
                        onChanged: (val) => setState(() {
                          _model.choiceChipsValue2 = val?.firstOrNull;
                          time = '12:00 pm - 1:00 pm';
                        }),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: const Color(0xFFB0D6E5),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).alternate,
                          iconSize: 18.0,
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          iconColor: FlutterFlowTheme.of(context).secondaryText,
                          iconSize: 0.0,
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        chipSpacing: 12.0,
                        rowSpacing: 12.0,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController4 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.62),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 17.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            String uUid = const Uuid().v4();

                            String numericChars =
                                uUid.replaceAll(RegExp(r'[^0-9]'), '');

                            String resId = numericChars.substring(0, 4);
                            String userId =
                                FirebaseAuth.instance.currentUser!.uid;
                            await FirebaseFirestore.instance
                                .collection('Reservations')
                                .add(
                              {
                                'UserID': userId,
                                'stadiumName': widget.stadium.name,
                                'stadiumNo': widget.stadium.stNo,
                                'time': time ?? '9:00 am - 10:00 am',
                                'date': selectesDTString ??
                                    DateTime.now().toString(),
                                'reservationId': resId,
                                'ImageUrl': widget.stadium.imgURL,
                              },
                            ).then((value) {
                              ReservationModel reservation = ReservationModel(
                                userId: userId,
                                name: widget.stadium.name,
                                date: selectesDTString ??
                                    DateTime.now().toString(),
                                time: time ?? '9:00 am - 10:00 am',
                                stadiumNo: widget.stadium.stNo,
                                reservationId: resId,
                                imageUrl: widget.stadium.imgURL,
                              );
                              context.push(AppRouter.kConfirmationView,
                                  extra: reservation);
                            }).catchError((e) {
                              showSnackbar(context,
                                  'Something went wrong: ${e.toString()}');
                            });
                          },
                          text: 'Book',
                          options: FFButtonOptions(
                            width: 106.0,
                            height: 30.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFD7ECF4),
                            textStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

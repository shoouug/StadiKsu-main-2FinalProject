import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/backend/schema/user_record.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'profile_final_model.dart';
export 'profile_final_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    super.key,
    this.profile,
  });

  final FFUploadedFile? profile;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileFinalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getUserData();
    _model = createModel(context, () => ProfileFinalModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  String? userName;

  getUserData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    setState(() {});
    // userName = FirebaseAuth.instance.currentUser!.displayName;
    FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .get()
        .then((value) {
      setState(() {});
      userName = value.data()!['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30, 0.0, 0.0),
              width: double.maxFinite,
              // height: 500.0,
              decoration: const BoxDecoration(
                color: Color(0xFFB0D6E5),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30.0,
                    color: Color(0x33000000),
                    offset: Offset(20.0, 0.0),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/default_logo.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  userName == null
                      ? Text(
                          'Wellcome',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 23.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )
                      : Text(
                          userName!,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 23.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          1.0, 0.0, 0.0, 12.0),
                      child: Text(
                        'College of computer and information sciences',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).labelMedium.copyWith(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDBEAF2),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30.0,
                          color: Color(0x33000000),
                          offset: Offset(20.0, 0.0),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(30.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          child: InkWell(
                            onTap: () => context
                                .push(AppRouter.kEditBookedReservationView),
                            child: Row(
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-0.88, -0.78),
                                  child: Icon(
                                    Icons.date_range,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Text(
                                  '       Edit my reservations',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 80.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // GoRouter.of(context).prepareAuthEvent();
                              // await authManager.signOut();
                              // GoRouter.of(context).clearRedirectLocation();
                              await FirebaseAuth.instance
                                  .signOut()
                                  .then(
                                    (value) => context.go(AppRouter.kStartView),
                                  )
                                  .catchError((e) =>
                                      showSnackbar(context, 'Error: $e'));
                            },
                            text: 'Log Out',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ].addToEnd(const SizedBox(height: 64.0)),
      ),
    );
  }
}

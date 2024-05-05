import 'package:flutter/material.dart';
import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/flutter_flow/flutter_flow_theme.dart';
import 'package:stadi_k_s_u/flutter_flow/flutter_flow_util.dart';
import 'package:stadi_k_s_u/reservation_model.dart';
import 'package:stadi_k_s_u/stadium_model.dart';

class ReservationItem extends StatefulWidget {
  const ReservationItem({
    super.key,
    required this.reservation,
  });
  final ReservationModel? reservation;
  @override
  State<ReservationItem> createState() => _StadiumItemState();
}

class _StadiumItemState extends State<ReservationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: const BoxDecoration(
          color: Color(0xFFDBEAF2),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: widget.reservation?.imageUrl == null
                    ? const CircularProgressIndicator()
                    : Image.network(
                        widget.reservation!.imageUrl,
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      14.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Stadium Name:\n   ${widget.reservation!.name}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF207E63),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      14.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Reservation ID: ${widget.reservation!.reservationId}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFF207E63),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

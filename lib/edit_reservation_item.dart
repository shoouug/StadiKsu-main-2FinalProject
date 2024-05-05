import 'package:flutter/material.dart';
import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/flutter_flow/flutter_flow_theme.dart';
import 'package:stadi_k_s_u/flutter_flow/flutter_flow_util.dart';
import 'package:stadi_k_s_u/reservation_model.dart';

class EditReservationItem extends StatefulWidget {
  const EditReservationItem({
    super.key,
    required this.reservation,
  });
  final ReservationModel reservation;

  @override
  State<EditReservationItem> createState() => _EditReservationItemState();
}

class _EditReservationItemState extends State<EditReservationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
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
                  child: Image.network(
                    widget.reservation.imageUrl,
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(14.0, 20.0, 75.0, 0.0),
                child: Text(
                  '${widget.reservation.name}\n${widget.reservation.date}\n${widget.reservation.stadiumNo}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF207E63),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.push(AppRouter.kEditBookedConfirmationView,
                          extra: widget.reservation);
                    },
                    child: Icon(
                      Icons.edit_calendar,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      var data = await FirebaseFirestore.instance
                          .collection('Reservations')
                          .where('reservationId',
                              isEqualTo: widget.reservation.reservationId)
                          .get();
                      if (data.docs.isNotEmpty) {
                        var reservationId = data.docs.first.id;
                        await FirebaseFirestore.instance
                            .collection('Reservations')
                            .doc(reservationId)
                            .delete()
                            .then((value) {
                          context.pop();
                          context.push(AppRouter.kEditBookedReservationView);
                          setState(() {});
                          showSnackbar(
                              context, 'Reservation deleted successfully');
                          print('=====================deleted');
                        });
                      }
                    },
                    child: const Icon(
                      Icons.delete_outlined,
                      color: Color(0xFFB21B25),
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

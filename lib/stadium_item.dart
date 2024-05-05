import 'package:flutter/material.dart';
import 'package:stadi_k_s_u/app_router.dart';
import 'package:stadi_k_s_u/flutter_flow/flutter_flow_theme.dart';
import 'package:stadi_k_s_u/flutter_flow/flutter_flow_util.dart';
import 'package:stadi_k_s_u/stadium_model.dart';

class StadiumItem extends StatefulWidget {
  const StadiumItem({
    super.key,
    required this.stadium,
  });
  final StadiumModel stadium;

  @override
  State<StadiumItem> createState() => _StadiumItemState();
}

class _StadiumItemState extends State<StadiumItem> {
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
            Row(
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
                      widget.stadium.imgURL,
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    14.0, 20.0, 0.0, 0.0),
                child: Text(
                  '${widget.stadium.name}\n${widget.stadium.state}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: const Color(0xFF207E63),
                        letterSpacing: 0.0,
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

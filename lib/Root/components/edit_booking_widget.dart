import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:food_delivery_app/Constants/colors.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class EditBookingWidget extends StatefulWidget {
  EditBookingWidget({
    Key key,
    this.userAppointment,
  }) : super(key: key);

  final AppointmentsRecord userAppointment;

  @override
  _EditBookingWidgetState createState() => _EditBookingWidgetState();
}

class _EditBookingWidgetState extends State<EditBookingWidget> {
  DateTime datePicked;
  String dropDownValue;
  TextEditingController personsNameController;
  TextEditingController problemDescriptionController;

  @override
  void initState() {
    super.initState();
    personsNameController =
        TextEditingController(text: widget.userAppointment.appointmentName);
    problemDescriptionController = TextEditingController(
        text: widget.userAppointment.appointmentDescription);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 3,
                indent: 150,
                endIndent: 150,
                color: Color(0xFF465056),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  'Edit Order',
                  style: FlutterFlowTheme.title3.override(
                    fontFamily: 'Lexend Deca',
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Fill out the information below in order to complete your Order with our office.',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Emails will be sent to:',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                child: AuthUserStreamWidget(
                  child: Text(
                    currentUserEmail,
                    style: FlutterFlowTheme.subtitle1.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: TextFormField(
                  controller: personsNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Ordering For',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.background,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.background,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FlutterFlowDropDown(
                  initialOption: dropDownValue ??=
                      widget.userAppointment.appointmentType,
                  options: [
                    'Payment Method',
                    'Mobile Money',
                    'Card',
                    'Delivery'
                  ].toList(),
                  onChanged: (val) => setState(() => dropDownValue = val),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.black,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.grayLight,
                    size: 15,
                  ),
                  fillColor: Colors.white,
                  elevation: 3,
                  borderColor: FlutterFlowTheme.background,
                  borderWidth: 2,
                  borderRadius: 8,
                  margin: EdgeInsetsDirectional.fromSTEB(20, 4, 16, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: TextFormField(
                  controller: problemDescriptionController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'What\'s Your Expectation?',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.background,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.background,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: InkWell(
                  onTap: () async {
                    await DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (date) {
                        setState(() => datePicked = date);
                      },
                      currentTime: DateTime.now(),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.background,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Text(
                                    'Choose Expected Date of delivery',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 4, 0, 0),
                                  child: Text(
                                    dateTimeFormat('MMMMEEEEd',
                                        widget.userAppointment.appointmentTime),
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.tertiaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                  icon: Icon(
                                    Icons.date_range_outlined,
                                    color: FlutterFlowTheme.grayLight,
                                    size: 20,
                                  ),
                                  iconSize: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 100,
                        height: 50,
                        color: FlutterFlowTheme.background,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final appointmentsUpdateData =
                            createAppointmentsRecordData(
                          appointmentName: personsNameController.text,
                          appointmentType: dropDownValue,
                          appointmentDescription:
                              problemDescriptionController.text,
                          appointmentTime: datePicked,
                        );
                        await widget.userAppointment.reference
                            .update(appointmentsUpdateData);
                        Navigator.pop(context);
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 150,
                        height: 50,
                        color: FlutterFlowTheme.primaryColor,
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 8,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel {
  final unfocusNode = FocusNode();
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
  emailAddressCreateTextControllerValidator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
  passwordCreateTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = LoginModel();
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.emailAddressCreateTextController ??= TextEditingController();
    _model.emailAddressCreateFocusNode ??= FocusNode();

    _model.passwordCreateTextController ??= TextEditingController();
    _model.passwordCreateFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    @override
    void dispose() {
      _model.dispose();
    };
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 32),
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5FBFB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/loginmed.png',
                        width: 392,
                        height: 362,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                    Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).width >= 768.0
                          ? 530.0
                          : 630.0,
                      constraints: BoxConstraints(
                        maxWidth: 570,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFffffff),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0xFF33000000),
                            offset: Offset(
                              0,
                              2,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Color(0xFFF5FBFB),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Column(
                            children: [
                            Align(
                            alignment: Alignment(0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: Color(0xFF101518),
                          unselectedLabelColor: Color(0xFF18aa99),
                          labelPadding:
                          EdgeInsetsDirectional.fromSTEB(
                              32, 0, 32, 0),
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          unselectedLabelStyle:TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          indicatorColor:
                          Color(0xFF06D5CD),
                          indicatorWeight: 3,
                          tabs: [
                            Tab(
                              text: 'Login',
                            ),
                            Tab(
                              text: 'Sign Up',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Align(
                              alignment:
                              AlignmentDirectional(0, -1),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    24, 16, 24, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                    Container(
                                    width: 230,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    'Welcome Back',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Welcome Back',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF57636C),
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Fill out the information below in order to access your account.',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF000000),
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.emailAddressCreateTextController,
                                        focusNode: _model.emailAddressCreateFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.email],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E7),
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFB00020),
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFB00020),
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFFFFFFF),
                                          contentPadding: EdgeInsets.all(24),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional
                                        .fromSTEB(
                                        0, 0, 0, 16),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model
                                            .passwordCreateTextController,
                                        focusNode: _model
                                            .passwordCreateFocusNode,
                                        autofocus: true,
                                        autofillHints: [
                                          AutofillHints.password
                                        ],
                                        obscureText: !_model
                                            .passwordCreateVisibility,
                                        decoration:
                                        InputDecoration(
                                          labelText: 'Password',
                                          labelStyle:TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500, // Medium
                                            color: Colors.black,
                                          ),
                                          enabledBorder:
                                          OutlineInputBorder(
                                            borderSide:
                                            BorderSide(
                                              color: Color(0xFFdfedec),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                40),
                                          ),
                                          focusedBorder:
                                          OutlineInputBorder(
                                            borderSide:
                                            BorderSide(
                                              color: Color(0xFF06D5CD),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                40),
                                          ),
                                          errorBorder:
                                          OutlineInputBorder(
                                            borderSide:
                                            BorderSide(
                                              color: Color(0xFFc4454d),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                40),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide:
                                            BorderSide(
                                              color: Color(0xFFc4454d),
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                40),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFffffff),
                                          contentPadding:
                                          EdgeInsets.all(
                                              24),
                                          suffixIcon: InkWell(
                                            onTap: () =>
                                                setState(
                                                      () => _model
                                                      .passwordCreateVisibility =
                                                  !_model
                                                      .passwordCreateVisibility,
                                                ),
                                            focusNode: FocusNode(
                                                skipTraversal:
                                                true),
                                            child: Icon(
                                              _model.passwordCreateVisibility
                                                  ? Icons
                                                  .visibility_outlined
                                                  : Icons
                                                  .visibility_off_outlined,
                                              color: Color(0xFF57636c),
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                        keyboardType: TextInputType.visiblePassword,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                    AlignmentDirectional(
                                        0, 0),
                                    child: Padding(
                                      padding:
                                      EdgeInsetsDirectional
                                          .fromSTEB(
                                          0, 0, 0, 16),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pushNamed(context, 'home');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white, backgroundColor: Colors.black, minimumSize: Size(230, 52), // Width and height
                                          padding: EdgeInsets.zero, // Text color
                                          textStyle: TextStyle( // Text style
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          elevation: 3, // Elevation
                                          side: BorderSide( // Border
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder( // Border radius
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                        ),
                                        child: Text('Login'),
                                      ),
                                    ),
                                  ),
                                  Column(
                                      mainAxisSize:
                                      MainAxisSize.max,
                                      children: [
                                      Align(
                                      alignment:
                                      AlignmentDirectional(
                                      0, 0),
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional
                                        .fromSTEB(
                                        16,
                                        0,
                                        16,
                                        24),
                                    child: Text(
                                      'Or sign in with',
                                      textAlign: TextAlign
                                          .center,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                  AlignmentDirectional(
                                      0, 0),
                                  child: Padding(
                                    padding:
                                    EdgeInsetsDirectional
                                        .fromSTEB(0,
                                        0, 0, 10),
                                    child: Wrap(
                                      spacing: 16,
                                      runSpacing: 0,
                                      alignment:
                                      WrapAlignment
                                          .center,
                                      crossAxisAlignment:
                                      WrapCrossAlignment
                                          .center,
                                      direction:
                                      Axis.horizontal,
                                      runAlignment:
                                      WrapAlignment
                                          .center,
                                      verticalDirection:
                                      VerticalDirection
                                          .down,
                                      clipBehavior:
                                      Clip.none,
                                      children: [
                                        Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                0,
                                                0,
                                                0,
                                                16),
                                            child: ElevatedButton.icon(
                                              onPressed: () async {
                                                if (context.mounted) {
                                                  Navigator.pushNamed(context, 'home');
                                                }
                                              },
                                              icon: FaIcon(
                                                FontAwesomeIcons.google,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              label: Text(
                                                'Continue with Google',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: Size(230, 44), backgroundColor: Color(0xFFffffff),
                                                padding: EdgeInsets.zero, // Background color
                                                onPrimary: Colors.black, // Text color
                                                elevation: 0, // Elevation
                                                side: BorderSide(
                                                  color: Color(0xFFdfedec),
                                                  width: 2,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(40),
                                                ),
                                                // Add more options as needed
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                  AlignmentDirectional(
                                      0, 0),
                                  child: Padding(
                                      padding:
                                      EdgeInsetsDirectional
                                          .fromSTEB(0,
                                          0, 0, 12),
                                      child: ElevatedButton(
                                          onPressed:
                                              () async {
                                          }
                                          Navigator.of(context).pushNamed('home');
                                  ),
                                ),
                              ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    ),
    )
    )
  }
  text:
  'Forgot Password?',
  ElevatedButton(
  height: 44,
  padding:
  EdgeInsetsDirectional
      .fromSTEB(
  32,
  0,
  32,
  0),
  iconPadding:
  EdgeInsetsDirectional
      .fromSTEB(
  0,
  0,
  0,
  0),
  color: Color(0xFFffffff),
  style: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 14,
  fontWeight: FontWeight.bold,
  ),
  elevation: 0,
  borderSide:
  BorderSide(
  color: Color(0xFFffffff),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  hoverColor:
  Color(0xF5FBFB),
  ),
  ),
  ),
  ),
  ],
  ),
  ],
  ),
  )
  ),
  ),
  Align(
  alignment:
  AlignmentDirectional(0, -1),
  child: Padding(
  padding:
  EdgeInsetsDirectional.fromSTEB(
  24, 16, 24, 0),
  child: SingleChildScrollView(
  child: Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment:
  CrossAxisAlignment.start,
  children: [
  if (responsiveVisibility(
  context: context,
  phone: false,
  tablet: false,
  ))
  Container(
  width: 230,
  height: 40,
  decoration: BoxDecoration(
  color: Color(0xFFffffff),
  ),
  ),
  Text(
  'Create Account',
  textAlign: TextAlign.start,
  style: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 28,
  fontWeight: FontWeight.normal,
  ),
  ),
  Padding(
  padding:
  EdgeInsetsDirectional
      .fromSTEB(
  0, 4, 0, 24),
  child: Text(
  'Let\'s get started by filling out the form below.',
  textAlign:
  TextAlign.start,
  style: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  ),
  ),
  ),
  Padding(
  padding:
  EdgeInsetsDirectional
      .fromSTEB(
  0, 0, 0, 16),
  child: Container(
  width: double.infinity,
  child: TextFormField(
  controller: _model
      .emailAddressTextController,
  focusNode: _model
      .emailAddressFocusNode,
  autofocus: true,
  autofillHints: [
  AutofillHints.email
  ],
  obscureText: false,
  decoration:
  InputDecoration(
  labelText: 'Email',
  style: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 16,
  fontWeight: FontWeight.w500, // 500 weight
  ),
  enabledBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFFf5fbfb),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  focusedBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFF06d5cd),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  errorBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFFdfedec),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  focusedErrorBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFFdfedec),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  filled: true,
  fillcolor: Color(0xFFffffff),
  contentPadding:
  EdgeInsetsDirectional
      .fromSTEB(
  24,
  24,
  0,
  24),
  ),
  style: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  ),
  keyboardType:
  TextInputType
      .emailAddress,
  validator: _model
      .emailAddressTextControllerValidator
      .asValidator(
  context),
  ),
  ),
  ),
  Padding(
  padding:
  EdgeInsetsDirectional
      .fromSTEB(
  0, 0, 0, 16),
  child: Container(
  width: double.infinity,
  child: TextFormField(
  controller: _model
      .passwordTextController,
  focusNode: _model
      .passwordFocusNode,
  autofocus: true,
  autofillHints: [
  AutofillHints.password
  ],
  obscureText: !_model
      .passwordVisibility,
  decoration:
  InputDecoration(
  labelText: 'Password',
  labelStyle: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Color(0xFFFF57636C),
  ),
  ),
  enabledBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFFdfedec),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  focusedBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFF06d5cd),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  errorBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFFC4454D),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  focusedErrorBorder:
  OutlineInputBorder(
  borderSide:
  BorderSide(
  color: Color(0xFFC4454D),
  width: 2,
  ),
  borderRadius:
  BorderRadius
      .circular(
  40),
  ),
  filled: true,
  fillcolor: Color(0xFFffffff),
  contentPadding:
  EdgeInsetsDirectional
      .fromSTEB(
  24,
  24,
  0,
  24),
  suffixIcon: InkWell(
  onTap: () =>
  setState(
  () => _model
      .passwordVisibility =
  !_model
      .passwordVisibility,
  ),
  focusNode: FocusNode(
  skipTraversal:
  true),
  child: Icon(
  _model.passwordVisibility
  ? Icons
      .visibility_outlined
      : Icons
      .visibility_off_outlined,
  color: Color(0xFF57636c),
  size: 24,
  ),
  ),
  ),
  style: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  ),
  validator: _model
      .passwordTextControllerValidator
      .asValidator(
  context),
  ),
  ),
  ),
  Align(
  alignment:
  AlignmentDirectional(
  0, 0),
  child: Padding(
  padding:
  EdgeInsetsDirectional
      .fromSTEB(
  0, 0, 0, 16),
  child: ElevatedButton(
  onPressed: () async {
  final user =
  await authManager
      .signInWithEmail(
  context,
  _model
      .emailAddressTextController
      .text,
  _model
      .passwordTextController
      .text,
  );
  if (user == null) {
  return;
  }
  Navigator.of(context).pushNamed('home');
  },
  text: 'Sign Up',
  ElevatedButton(
  width: 230,
  height: 52,
  padding:
  EdgeInsetsDirectional
      .fromSTEB(0,
  0, 0, 0),
  iconPadding:
  EdgeInsetsDirectional
      .fromSTEB(0,
  0, 0, 0),
  color:
  Color(0xFF070707),
  style: TextStyle(
  fontFamily: 'Poppins',
  color: Colors.white,
  letterSpacing: 0,
  fontSize: 16,
  fontWeight: FontWeight.w500, // medium font weight
  ),
  elevation: 3,
  borderSide:
  BorderSide(
  color: Colors
      .transparent,
  width: 1,
  ),
  borderRadius:
  BorderRadius
      .circular(40),
  ),
  ),
  ),
  ),
  Align(
  alignment:
  AlignmentDirectional(
  0, 0),
  child: Padding(
  padding:
  EdgeInsetsDirectional
      .fromSTEB(16, 0,
  16, 24),
  child: Text(
  'Or sign in with',
  textAlign:
  TextAlign.center,
  style: TextStyle(
  fontFamily: 'Poppins',
  letterSpacing: 0,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  ),
  ),
  ),
  ),
  Align(
  alignment:
  AlignmentDirectional(
  0, 0),
  child: Wrap(
  spacing: 16,
  runSpacing: 0,
  alignment:
  WrapAlignment.center,
  crossAxisAlignment:
  WrapCrossAlignment
      .center,
  direction:
  Axis.horizontal,
  runAlignment:
  WrapAlignment.center,
  verticalDirection:
  VerticalDirection
      .down,
  clipBehavior: Clip.none,
  children: [
  Padding(
  padding:
  EdgeInsetsDirectional
      .fromSTEB(0,
  0, 0, 16),
  child: ElevatedButton(
  onPressed:
  () async {
  }
  Navigator.of(context).pushNamed('home');
},
text:
'Continue with Google',
icon: FaIcon(
FontAwesomeIcons
    .google,
size: 20,
),
ElevatedButton(
width: 230,
height: 44,
padding:
EdgeInsetsDirectional
    .fromSTEB(
0,
0,
0,
0),
iconPadding:
EdgeInsetsDirectional
    .fromSTEB(
0,
0,
0,
0),
color: Color(0xFFffffff),
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 14,
fontWeight: FontWeight.bold,
),
elevation: 0,
borderSide:
BorderSide(
color: Color(0xFFDFEDEC),
width: 2,
),
borderRadius:
BorderRadius.circular(
40),
hovercolor: Color(0xFFf5fbfb),
),
),
),
],
),
),
),
Align(
alignment:
AlignmentDirectional(
0, 0),
child: Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(0,
0, 0, 12),
child: ElevatedButton(
onPressed:
() async {
}
Navigator.of(context).pushNamed('home');
},
text:
'Forgot Password?',
ElevatedButton( //a
height: 44,
padding:
EdgeInsetsDirectional
    .fromSTEB(
32,
0,
32,
0),
iconPadding:
EdgeInsetsDirectional
    .fromSTEB(
0,
0,
0,
0),
color: Color(0xFFffffff),
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 14,
fontWeight: FontWeight.bold,
),

elevation: 0,
borderSide:
BorderSide(
color: Color(0xFFffffff),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
hoverColor:
Color(0xF5FBFB),
),
),
),
),
],
),
],
),
)
),
),
Align(
alignment:
AlignmentDirectional(0, -1),
child: Padding(
padding:
EdgeInsetsDirectional.fromSTEB(
24, 16, 24, 0),
child: SingleChildScrollView(
child: Column(
mainAxisSize: MainAxisSize.max,
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
Container(
width: 230,
height: 40,
decoration: BoxDecoration(
color: Color(0xFFffffff),
),
),
Text(
'Create Account',
textAlign: TextAlign.start,
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 28,
fontWeight: FontWeight.normal,
),
),
Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(
0, 4, 0, 24),
child: Text(
'Let\'s get started by filling out the form below.',
textAlign:
TextAlign.start,
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 14,
fontWeight: FontWeight.w500,
),
),
),
Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(
0, 0, 0, 16),
child: Container(
width: double.infinity,
child: TextFormField(
controller: _model
    .emailAddressTextController,
focusNode: _model
    .emailAddressFocusNode,
autofocus: true,
autofillHints: [
AutofillHints.email
],
obscureText: false,
decoration:
InputDecoration(
labelText: 'Email',
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 16,
fontWeight: FontWeight.w500, // 500 weight
),
enabledBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFFf5fbfb),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
focusedBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFF06d5cd),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
errorBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFFdfedec),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
focusedErrorBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFFdfedec),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
filled: true,
fillcolor: Color(0xFFffffff),
contentPadding:
EdgeInsetsDirectional
    .fromSTEB(
24,
24,
0,
24),
),
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 16,
fontWeight: FontWeight.normal,
),
keyboardType:
TextInputType
    .emailAddress,
validator: _model
    .emailAddressTextControllerValidator
    .asValidator(
context),
),
),
),
Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(
0, 0, 0, 16),
child: Container(
width: double.infinity,
child: TextFormField(
controller: _model
    .passwordTextController,
focusNode: _model
    .passwordFocusNode,
autofocus: true,
autofillHints: [
AutofillHints.password
],
obscureText: !_model
    .passwordVisibility,
decoration:
InputDecoration(
labelText: 'Password',
labelStyle: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 16,
fontWeight: FontWeight.w500,
color: Color(0xFFFF57636C),
),
),
enabledBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFFdfedec),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
focusedBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFF06d5cd),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
errorBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFFC4454D),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
focusedErrorBorder:
OutlineInputBorder(
borderSide:
BorderSide(
color: Color(0xFFC4454D),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
),
filled: true,
fillcolor: Color(0xFFffffff),
contentPadding:
EdgeInsetsDirectional
    .fromSTEB(
24,
24,
0,
24),
suffixIcon: InkWell(
onTap: () =>
setState(
() => _model
    .passwordVisibility =
!_model
    .passwordVisibility,
),
focusNode: FocusNode(
skipTraversal:
true),
child: Icon(
_model.passwordVisibility
? Icons
    .visibility_outlined
    : Icons
    .visibility_off_outlined,
color: Color(0xFF57636c),
size: 24,
),
),
),
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 16,
fontWeight: FontWeight.normal,
),
validator: _model
    .passwordTextControllerValidator
    .asValidator(
context),
),
),
),
Align(
alignment:
AlignmentDirectional(
0, 0),
child: Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(
0, 0, 0, 16),
child: ElevatedButton(
onPressed: () async {
GoRouter.of(context)
    .prepareAuthEvent();

final user =
await authManager
    .signInWithEmail(
context,
_model
    .emailAddressTextController
    .text,
_model
    .passwordTextController
    .text,
);
if (user == null) {
return;
}

context.goNamedAuth(
'home',
context.mounted);
},
text: 'Sign Up',
ElevatedButton( //a
width: 230,
height: 52,
padding:
EdgeInsetsDirectional
    .fromSTEB(0,
0, 0, 0),
iconPadding:
EdgeInsetsDirectional
    .fromSTEB(0,
0, 0, 0),
color:
Color(0xFF070707),
style: TextStyle(
fontFamily: 'Poppins',
color: Colors.white,
letterSpacing: 0,
fontSize: 16,
fontWeight: FontWeight.w500, // medium font weight
),
elevation: 3,
borderSide:
BorderSide(
color: Colors
    .transparent,
width: 1,
),
borderRadius:
BorderRadius
    .circular(40),
),
),
),
),
Align(
alignment:
AlignmentDirectional(
0, 0),
child: Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(16, 0,
16, 24),
child: Text(
'Or sign in with',
textAlign:
TextAlign.center,
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 14,
fontWeight: FontWeight.w500,
),
),
),
),
Align(
alignment:
AlignmentDirectional(
0, 0),
child: Wrap(
spacing: 16,
runSpacing: 0,
alignment:
WrapAlignment.center,
crossAxisAlignment:
WrapCrossAlignment
    .center,
direction:
Axis.horizontal,
runAlignment:
WrapAlignment.center,
verticalDirection:
VerticalDirection
    .down,
clipBehavior: Clip.none,
children: [
Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(0,
0, 0, 16),
child: ElevatedButton(
onPressed:
() async {//google signin
}
//navigate to home
},
text:
'Continue with Google',
icon: FaIcon(
FontAwesomeIcons
    .google,
size: 20,
),
ElevatedButton( //a
width: 230,
height: 44,
padding:
EdgeInsetsDirectional
    .fromSTEB(
0,
0,
0,
0),
iconPadding:
EdgeInsetsDirectional
    .fromSTEB(
0,
0,
0,
0),
color: Color(0xFFffffff),
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 14,
fontWeight: FontWeight.bold,
),

elevation: 0,
borderSide:
BorderSide(
color: Color(0xFFDFEDEC),
width: 2,
),
borderRadius:
BorderRadius
    .circular(
40),
hoverColor:
Color(0xF5FBFB),
),
),
),
],
),
),
Align(
alignment:
AlignmentDirectional(
0, 0),
child: Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(
0, 0, 0, 16),
child: ElevatedButton(
onPressed: () async {//google signin firebase
}

context.goNamedAuth(
'home',
context.mounted);
},
text:
'Forgot Password?',
ElevatedButton( //a
height: 44,
padding:
EdgeInsetsDirectional
    .fromSTEB(32,
0, 32, 0),
iconPadding:
EdgeInsetsDirectional
    .fromSTEB(0,
0, 0, 0),
color: Color(0xFFffffff),
style: TextStyle(
fontFamily: 'Poppins',
letterSpacing: 0,
fontSize: 14,
fontWeight: FontWeight.bold,
),
elevation: 0,
borderSide:
BorderSide(
color: Color(0xFFffffff),
width: 2,
),
borderRadius:
BorderRadius
    .circular(40),
hoverColor:
Color(0xf5fbfb),
),
),
),
),
],
),
)
),
),
],
),
),
],
),
),
)
),
],
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
,
),
borderRadius:
BorderRadius
    .circular(
40),
hoverColor:
Color(0xF5FBFB),
),
),
),
],
),
),
Align(
alignment:
AlignmentDirectional(
0, 0),
child: Padding(
padding:
EdgeInsetsDirectional
    .fromSTEB(
0, 0, 0, 16),
child: ElevatedButton(
onPressed: () async {//googlefirebase here
}

context.goNamedAuth(
'home',
context.mounted);
},
text:
'Forgot Password?',
ElevatedButton( //a
height: 44,
padding:
EdgeInsetsDirectional
    .fromSTEB(32,
0, 32, 0),
iconPadding:
EdgeInsetsDirectional
    .fromSTEB(0,
0, 0, 0),
color: Color(0xFFffffff),
textStyle: TextStyle(
fontWeight: FontWeight.w500,
fontFamily:
'Poppins',
letterSpacing:
0,
fontWeight:
FontWeight
    .bold,
),
elevation: 0,
borderSide:
BorderSide(
color: Color(0xFFffffff),
width: 2,
),
borderRadius:
BorderRadius
    .circular(40),
hoverColor:Color(0xFFf5fbfb),
),
),
),
),
],
),
)
),
),
],
),
),
],
),
),
)
),
],
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

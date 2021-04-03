import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[500],
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size:50,
        ),
      ),
    );
  }
}

class LoadingGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[500],
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size:50,
        ),
      ),
    );
  }
}

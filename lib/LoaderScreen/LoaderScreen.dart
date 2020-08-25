import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderScreen extends StatefulWidget {
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(color: Colors.grey.withOpacity(0.5)),
    );
  }
}

// SpinKitWave(
//     color: Colors.grey.withOpacity(0.3),
//     type: SpinKitWaveType.start),
// SpinKitRotatingCircle(color: Colors.white),
// SpinKitRotatingPlain(color: Colors.white),
// SpinKitChasingDots(color: Colors.white),
// SpinKitPumpingHeart(color: Colors.white),
// SpinKitPulse(color: Colors.white),
// SpinKitDoubleBounce(color: Colors.white),
// SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
// SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
// SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
// SpinKitThreeBounce(color: Colors.white),
// SpinKitWanderingCubes(color: Colors.white),
// SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle),
// SpinKitCircle(color: Colors.white),
// SpinKitFadingFour(color: Colors.white),
// SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
// SpinKitFadingCube(color: Colors.white),
// SpinKitCubeGrid(size: 51.0, color: Colors.white),
// SpinKitFoldingCube(color: Colors.white),
// SpinKitRing(color: Colors.white),
// SpinKitDualRing(color: Colors.white),
// SpinKitRipple(color: Colors.white),
// SpinKitFadingGrid(color: Colors.white),
// SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
// SpinKitHourGlass(color: Colors.white),
// SpinKitSpinningCircle(color: Colors.white),
// SpinKitSpinningCircle(
//     color: Colors.white, shape: BoxShape.rectangle),
// SpinKitFadingCircle(color: Colors.white),
// SpinKitPouringHourglass(color: Colors.grey.withOpacity(0.5)),

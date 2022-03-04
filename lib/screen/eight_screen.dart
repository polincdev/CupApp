
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;

import '../components/path_painter.dart';
import '../utils/Utils.dart';

class EightScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return EightScreenState();
  }

}

class EightScreenState  extends State<StatefulWidget> with SingleTickerProviderStateMixin{
  late int timeFrom;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 100),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    // TODO: implement initState
    timeFrom= (DateTime.now().millisecondsSinceEpoch/1000).toInt();
    print("dela="+timeFrom.toString());
    super.initState();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<FragmentProgram> initShader() async {
    late ByteBuffer spirvBuffer;
    try {
      spirvBuffer = await Utils.getFileDataFromAssets(    "assets/shaders/shader.sprv");
      //  print("SHADER=" + spirvBuffer.toString());
      FragmentProgram fraProg = await FragmentProgram.compile(
          spirv: spirvBuffer, debugPrint: true);
      return fraProg;
    }
    catch(e){print("errar="+e.toString());}
    //TEST never reached
    FragmentProgram fraProg = await FragmentProgram.compile(  spirv: spirvBuffer, debugPrint: true);
    return fraProg;
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return Scaffold(
     body: FutureBuilder( //  CustomPaint(painter: PathPainter())
       future: initShader(),
       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if(snapshot.connectionState==ConnectionState.waiting)
           return CircularProgressIndicator();
         else  if(snapshot.hasError)
           return Text("Error "+snapshot.error.toString());
         else
           return SpinningContainer(controller: _controller, fraProg:  snapshot.data as FragmentProgram, timeFrom: timeFrom,);
          // return   CustomPaint(painter: PathPainter());
       },
     ),




   );
  }
}

class SpinningContainer extends AnimatedWidget {
  final FragmentProgram fraProg;
  final AnimationController controller;
  final int timeFrom;
  const SpinningContainer({
    Key? key,
    required this.fraProg,
    required this.timeFrom,
    required this.controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return
      Transform.rotate(
        angle:  0,// _progress.value * 2.0 * math.pi,
        child:  Container( width: size.width,height: size.height  ,
          child:    CustomPaint(painter: ShaderPainter2( size:size,fraProg:fraProg, timeFrom:  timeFrom)),


        ),
      );
  }

}



class ShaderPainter2 extends CustomPainter {
  final Size size;
  Paint _paint = Paint();
  final FragmentProgram fraProg;
  final int timeFrom ;
  ShaderPainter2( {required this.size,required this.fraProg, required this.timeFrom}){

  }


  @override
  void paint(Canvas canvas, Size size) {
    int delta=(DateTime.now().millisecondsSinceEpoch/1000).toInt()-timeFrom;
    print("dela="+delta.toString());
    Shader shader = fraProg.shader( floatUniforms: Float32List.fromList(
        <double>[
          timeFrom.toDouble(),
          delta.toDouble(),//
          size.width,
          size.height,// Delta
          0.1]), );
    _paint.shader=shader;
    // Color paintColor = Colors.blue.withOpacity(0.50);
    //  _paint.color = paintColor;

    canvas.drawPaint(_paint);
    //canvas.drawRect(const Rect.fromLTWH(0, 0, 100, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

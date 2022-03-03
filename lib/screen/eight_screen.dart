
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

class EightScreenState  extends State<StatefulWidget>{



  Future<Shader> initShader() async {
    try {
      ByteBuffer spirvBuffer = await Utils.getFileDataFromAssets(
          "assets/shaders/shader.sprv");
      print("SHADER=" + spirvBuffer.toString());
      FragmentProgram fraProg = await FragmentProgram.compile(
          spirv: spirvBuffer, debugPrint: true);
      Shader shader = fraProg.shader(/*
        floatUniforms: Float32List.fromList(<double>[1]),*/);
      return shader;
    }
    catch(e){print("errar="+e.toString());}

    final Rect rect =  const Offset(1.0, 2.0) & const Size(3.0, 4.0);
    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
      stops: <double>[0.4, 1.0],
    );


    return gradient.createShader(rect);
  }


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
   return Scaffold(
     body:  Container( width: size.width,height: size.height  ,
          child:


          Container(
            width:size.width,height:size.height*0.4,
            child: Stack(
                children:[
                  Positioned(top:120,left:150,

                      child:

                      Container(   width:150,height:150,
                             child:
                           //  CustomPaint(painter: PathPainter())

                             FutureBuilder(
                               future: initShader(),
                               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                 if(snapshot.connectionState==ConnectionState.waiting)
                                   return CircularProgressIndicator();
                                 else  if(snapshot.hasError)
                                   return Text("Error "+snapshot.error.toString());
                                 else
                                  // return   CustomPaint(painter: PathPainter());
                                   return CustomPaint(painter: ShaderPainter2(shader:snapshot.data as Shader)) ;
                               },
                             ),


                  ),

                  ) ,
                ]
            ),

          )





     ),
   );
  }
}


class ShaderPainter extends CustomPainter {

  final Shader shader;
  final Paint _paint;
  ShaderPainter({required this.shader}):_paint=Paint()..shader=shader;
  @override
  void paint(Canvas canvas, Size size) {

    final angle = -math.pi / 4;
    Color paintColor = Colors.orange.withOpacity(0.75);
    Paint circlePaint = Paint()
      ..color = paintColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    canvas.save();
    // canvas.translate(100, 100);
    canvas.rotate(angle);
    canvas.drawOval(Rect.fromCenter(center: Offset.zero, width: 155, height: 170), circlePaint);
    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ShaderPainter2 extends CustomPainter {
  final Shader shader;
  final Paint _paint;
  ShaderPainter2({required this.shader}):_paint=Paint() ;


  @override
  void paint(Canvas canvas, Size size) {

    Color paintColor = Colors.blue.withOpacity(0.50);

    _paint.color = paintColor;
     _paint.shader=shader;

     canvas.drawPaint(_paint);
    canvas.drawRect(const Rect.fromLTWH(0, 0, 100, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
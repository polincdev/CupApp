
import 'package:flutter/material.dart';
import 'package:cupapp/utils/constants.dart';
import 'dart:math' as math;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SixScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return SixScreenState();
  }

}

class SixScreenState extends State<StatefulWidget> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return SafeArea(
     child: Scaffold(
     //  extendBodyBehindAppBar: true,
         backgroundColor: Colors.deepPurple,
       appBar: AppBar(
         centerTitle: true,
         backgroundColor:  Colors.transparent,
         elevation: 0,
         leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () { Navigator.pop(context) ;},),
        title: Text("My sleep", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
       ),



       body:Column(
           children: [
                  Flexible(flex:1,fit:FlexFit.tight,child: Container(width:size.width,
                  child:Text("Sleep schedule", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),

                  )),
                  Flexible(flex:3,child: Container(width:size.width,
                  child:
                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Sleep schedule'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_SalesData, String>>[
                        BarSeries<_SalesData, String>(
                            dataSource: data,
                            xValueMapper: (_SalesData sales, _) => sales.year,
                            yValueMapper: (_SalesData sales, _) => sales.sales,
                            name: 'Sales',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(isVisible: true))
                      ]),
                  )),
                  Flexible(flex:1,child: Container(width:size.width, color: Colors.green )),
                  Flexible(flex:3,child: Container(width:size.width, color: Colors.blue )),

           ]
       )
       ),
   );

  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
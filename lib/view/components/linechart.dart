import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/homeController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemple de Graphique')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BarChartSample(),
        ),
      ),
    );
  }
}

class BarChartSample extends StatefulWidget {
  @override
  _BarChartSampleState createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  List<int> data = [Get.find<HomeController>().client!.numberofPackagesSended!,
  Get.find<HomeController>().client!.numberofPackagesDelivred! ]; //les donnees a entre 

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        barTouchData: BarTouchData(enabled: true),
        titlesData: const  FlTitlesData(
          bottomTitles: AxisTitles(
            axisNameWidget: Text( 
              '             Delivred                               Sended',
               style: TextStyle(
                color: AppColors.buttonColor,

               ),),
            
            sideTitles:  SideTitles(
              showTitles: false
            )
          ),
          rightTitles:  AxisTitles(
            sideTitles: SideTitles(
              showTitles: false
            )
          ),
          topTitles:  AxisTitles(
            sideTitles: SideTitles(
              showTitles: false
            )
          )
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          data.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                
                color: Colors.blue,
                width: 16, toY: data[index].toDouble(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

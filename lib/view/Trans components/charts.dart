import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransHomeController.dart';
import 'package:transmobile/view/utils/colors.dart';


class charts extends StatefulWidget {
  
 const  charts({super.key,});

  @override
  State<charts> createState() => _chartsState();
}

class _chartsState extends State<charts> {
  List<int>data= [Get.find<transHomeController>().transporter!.numberofClients,
  Get.find<transHomeController>().transporter!.numberofTrips
  ];
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
              '             Client Number                    Trip Number',
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

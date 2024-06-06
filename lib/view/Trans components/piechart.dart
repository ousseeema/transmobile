// ignore_for_file: non_constant_identifier_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/transporteur/TransHomeController.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: Dimenssions.height20,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final controller = Get.find<transHomeController>();
    final numberofPackages = controller.transporter?.numberofPackages ?? 0;
    final totalRevenue = controller.transporter?.totalRevenue ?? 0.0;
    final TripPackagesLength = controller.Trip?.packages.length ?? 0;
    final externlPackages = controller.Trip?.self_packages.length??0;


    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? Dimenssions.font20 + 4 : Dimenssions.font20 - 5;
      final radius = isTouched ? Dimenssions.radius30 * 2 : Dimenssions.radius30 * 2 - 10;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: numberofPackages.toDouble(),
            title: ' $numberofPackages packages',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: totalRevenue.toDouble(),
            title: 'Total Revenu: $totalRevenue \$',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.green,
            value: TripPackagesLength.toDouble(),
            title: ' $TripPackagesLength Interanl package',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor,
              shadows: shadows,
            ),
          );
          case 3:
          return PieChartSectionData(
            color: Colors.red,
            value: externlPackages.toDouble(),
            title: ' $TripPackagesLength external package',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.mainTextColor,
              shadows: shadows,
            ),
          );
          
        default:
          throw Error();
      }
    });
  }
}

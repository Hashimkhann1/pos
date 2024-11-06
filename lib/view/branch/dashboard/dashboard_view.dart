import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/component/dashboard_box.dart';
import 'package:pos/component/my_text.dart';
import 'package:pos/res/color/app_color.dart';
import '../../../component/drawer/drawer_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final List<double> monthlySalesData = [30, 50, 30,20, 50, 10,60];
  String selectedSaleDateForHistory = '';


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard"),),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DashboardBox(
                  title: "Cash Sale",
                  subtitle: "0",
                  icon: CupertinoIcons.money_dollar,
                ),
                DashboardBox(
                  title: "Credit Sale",
                  subtitle: "0",
                  icon: CupertinoIcons.creditcard,
                ),
                DashboardBox(
                  title: "Total Sale",
                  subtitle: "0",
                  icon: CupertinoIcons.chart_bar,
                ),
                DashboardBox(
                  title: "Total Installment",
                  subtitle: "0",
                  icon: CupertinoIcons.time,
                ),
                DashboardBox(
                  title: "Supplier Payment",
                  subtitle: "0",
                  icon: CupertinoIcons.arrow_right_circle,
                ),
              ],
            ),

            /// daily reports
            Container(
              width: width,
              height: height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                  itemBuilder: (context , index) {
                return InkWell(
                  onTap: (){
                    setState(() {
                      selectedSaleDateForHistory = index.toString();
                    });
                  },
                  child: Container(
                    width: 120,
                    height: height * 0.2,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                        color: selectedSaleDateForHistory.isNotEmpty && int.parse(selectedSaleDateForHistory) == index ? Colors.grey.withOpacity(0.4) : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          children: [
                            /// Total sale
                            MyText(title: "500000",fontSize: 18,fontWeight: FontWeight.bold,),

                            /// date
                            MyText(title: "13/11/2024",color: Colors.grey.withOpacity(0.8),),
                          ],
                        ),

                        Container(width: 14, height: height * 0.14,color: AppColor.primaryColor,)

                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}


// SizedBox(
// height: 500,
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: LineChart(
// LineChartData(
// minY: 0,
// maxY: 100,
// lineBarsData: [
// LineChartBarData(
// spots: List.generate(monthlySalesData.length, (index) {
// return FlSpot(index.toDouble(), monthlySalesData[index]);
// }),
// isCurved: true,
// color: AppColor.primaryColor,
// barWidth: 4,
//
// belowBarData: BarAreaData(
// show: true,
// color: AppColor.primaryColor.withOpacity(0.1),
// ),
// dotData: FlDotData(show: true),
// ),
// ],
// lineTouchData: LineTouchData(
// touchTooltipData: LineTouchTooltipData(
// getTooltipColor: (spot) => Colors.white,
// tooltipPadding: const EdgeInsets.all(8),
// tooltipRoundedRadius: 8,
// getTooltipItems: (List<LineBarSpot> touchedSpots) {
// return touchedSpots.map((spot) {
// return LineTooltipItem(
// '${spot.y.toInt()}',  // Display the y value
// const TextStyle(color: Colors.black),  // Set text color to black for contrast
// );
// }).toList();
// },
// ),
// ),
// titlesData: FlTitlesData(
// bottomTitles: AxisTitles(
// drawBelowEverything: false,
// sideTitles: SideTitles(
// showTitles: true,
// reservedSize: 32,
// interval: 1,
// getTitlesWidget: (value, _) {
// switch (value) {
// case 0:
// return Text('Monday');
// case 1:
// return Text('Tuesday');
// case 2:
// return Text('Wenesday');
// case 3:
// return Text('Thusday');
// case 4:
// return Text('Friday');
// case 5:
// return Text('Saturday');
// case 6:
// return Text('Sunday');
// default:
// return Text('');
// }
// },
// ),
// ),
// rightTitles: AxisTitles(),
// topTitles: AxisTitles(),
// leftTitles: AxisTitles(
// sideTitles: SideTitles(
// showTitles: true,
// interval: 20,
// reservedSize: 50,
// getTitlesWidget: (value, _) => Text('${value.toInt()}k'),
// ),
// ),
// ),
// gridData: FlGridData(
// show: true,
// drawVerticalLine: true,
// getDrawingHorizontalLine: (value) => FlLine(
// color: Colors.white.withOpacity(0.1),
// strokeWidth: 1,
// ),
// getDrawingVerticalLine: (value) => FlLine(
// color: Colors.white.withOpacity(0.1),
// strokeWidth: 1,
// ),
// ),
// borderData: FlBorderData(show: false),
// ),
// ),
// ),
// ),
// ),


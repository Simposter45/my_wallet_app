import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/lists.dart';

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double? y;
}

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 13),
      ChartData(2012, 34),
      ChartData(2013, 27),
      ChartData(2014, 40)
    ];

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$9400',
                      style: AppTextStyles.poppins30Blackbold
                          .copyWith(fontSize: 36),
                    ),
                    DropdownMenu(
                      trailingIcon:
                          const Icon(Icons.keyboard_arrow_down_rounded),
                      hintText: views.first,
                      initialSelection: views.first,
                      width: 120,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      dropdownMenuEntries:
                          views.map<DropdownMenuEntry<String>>((value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: const Text('July 22, 2023',
                        style: AppTextStyles.poppins14Grey)),
                const SizedBox(height: 20),
                SfCartesianChart(series: <ChartSeries>[
                  // Renders spline chart
                  SplineSeries<ChartData, int>(
                      dataSource: chartData,
                      xValueMapper: (data, _) => data.x,
                      yValueMapper: (data, _) => data.y)
                ]),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Transactions',
                      style: AppTextStyles.poppins20Blackbold,
                    ),
                    const Spacer(),
                    const Text('See All', style: AppTextStyles.poppins16Blue),
                    IconButton(
                        splashRadius: 10,
                        onPressed: () {},
                        icon: const Icon(Icons.filter_alt)),
                  ],
                ),
                const SizedBox(height: 30),
                Image.asset('assets/png/no_transactions.png'),
                const SizedBox(width: 10),
                const Text(
                  "Looks like you haven't made any transactions yet",
                  style: AppTextStyles.poppins14Grey2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

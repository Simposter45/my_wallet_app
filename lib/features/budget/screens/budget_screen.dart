import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

import '../../../core/utils/lists.dart';
import '../../home/store/home_store.dart';
import '../model/earnings_model.dart';
import '../model/savings_model.dart';
import '../store/budget_store.dart';
import '../widgets/savings_widget.dart';
import 'budget_details_screen.dart';
import 'earnings_screen.dart';
import 'savings_screen.dart';

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class BudgetProviders extends StatelessWidget {
  const BudgetProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<BudgetStore>(
        create: (_) => BudgetStore(),
      ),
    ], child: BudgetScreen());
  }
}

// ignore: must_be_immutable
class BudgetScreen extends StatelessWidget {
  BudgetScreen({Key? key}) : super(key: key);

  final List<ChartData> chartData = [
    ChartData('Earnings', 52, AppColors.chartColor3),
    ChartData('Savings', 34, AppColors.chartColor2),
    ChartData('Expenses', 38, AppColors.chartColor1),
  ];

  @override
  Widget build(BuildContext context) {
    final store = context.read<BudgetStore>();
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Statistic',
                      style:
                          AppTextStyles.poppins20Black.copyWith(fontSize: 22),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            side: const MaterialStatePropertyAll(
                                BorderSide(color: AppColors.blue)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('+ Create'),
                        ))
                  ],
                ),
                const SizedBox(height: 10),
                DropdownMenu(
                  trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
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
                SfCircularChart(
                  legend: Legend(
                    width: '110%',
                    legendItemBuilder:
                        (legendText, series, point, seriesIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color:
                                chartData[seriesIndex].color.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: chartData[seriesIndex].color,
                                ),
                                const SizedBox(width: 5),
                                Text(chartData[seriesIndex].x),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    alignment: ChartAlignment.near,
                    isVisible: true,
                    position: LegendPosition.bottom,
                  ),
                  series: <CircularSeries>[
                    DoughnutSeries<ChartData, String>(
                        legendIconType: LegendIconType.circle,
                        dataSource: chartData,
                        xValueMapper: (data, _) => data.x,
                        yValueMapper: (data, _) => data.y,
                        enableTooltip: true,
                        innerRadius: '70%',
                        pointColorMapper: (data, _) => data.color,
                        radius: '50%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Earnings', style: AppTextStyles.poppins20Black),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Provider.value(
                                value: store, child: const EarningsScreen())));
                      },
                      child: const Text('See All',
                          style: AppTextStyles.poppins16Blue),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (earningList.isNotEmpty)
                  SizedBox(
                    height: 150,
                    child: Observer(
                      builder: (context) => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                          itemCount: store.earningsList.length,
                          itemBuilder: (context, index) {
                            final earning = store.earningsList[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Provider.value(
                                          value: store,
                                          child: BudgetDetailsScreen(
                                            index: index,
                                            isEarning: true,
                                          ),
                                        )));
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: earning.color.withOpacity(0.22),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 16),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Text(
                                          earning.name.substring(0, 1),
                                          style:
                                              AppTextStyles.poppins20Blackbold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        earning.name,
                                        style: AppTextStyles.poppins14Black
                                            .copyWith(color: earning.color),
                                      ),
                                      Text(
                                        '\$ ${earning.amount}',
                                        style: AppTextStyles.poppins20Blackbold
                                            .copyWith(color: earning.color),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                if (earningList.isEmpty)
                  Column(
                    children: [
                      Image.asset('assets/png/no_earnings.png'),
                      const SizedBox(width: 10),
                      const Text(
                        "You don't have any earnings yet. Create now!",
                        style: AppTextStyles.poppins14Grey2,
                      )
                    ],
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Savings', style: AppTextStyles.poppins20Black),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Provider.value(
                                value: store, child: const SavingsScreen())));
                      },
                      child: const Text('See All',
                          style: AppTextStyles.poppins16Blue),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (store.savingsList.isNotEmpty)
                  Observer(
                    builder: (context) => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: store.savingsList.length ~/ 2,
                      itemBuilder: (context, index) {
                        // final savingsItem1 = store.savingsList[index];
                        // final savingsItem2 = store
                        //     .savingsList[store.savingsList.length ~/ 2 + index];
                        return Row(
                          children: [
                            SavingsWidget(index: index),
                            const SizedBox(width: 16),
                            SavingsWidget(
                                index: (store.savingsList.length ~/ 2) + index),
                          ],
                        );
                      },
                    ),
                  ),
                if (store.savingsList.isEmpty)
                  Column(
                    children: [
                      Image.asset('assets/png/no_savings.png'),
                      const SizedBox(width: 10),
                      const Text(
                        "You don't have any savings yet. Create now!",
                        style: AppTextStyles.poppins14Grey2,
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

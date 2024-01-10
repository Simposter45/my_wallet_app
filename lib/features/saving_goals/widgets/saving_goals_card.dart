import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../home/widgets/icon_widget.dart';

import '../model/saving_goals_model.dart';
import '../store/saving_goals_store.dart';

class SavingGoalsCard extends StatelessWidget {
  const SavingGoalsCard({
    required this.store,
    required this.savingGoalsModel,
    Key? key,
  }) : super(key: key);

  final SavingGoalsStore store;
  final SavingGoalsModel savingGoalsModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  savingGoalsModel.itemName,
                  style:
                      AppTextStyles.poppins16Blue.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 15),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Balance',
                        style: AppTextStyles.poppins12Black,
                      ),
                      Text(
                        '0%',
                        style: AppTextStyles.poppins12Black,
                      ),
                    ]),
                Stack(
                  children: [
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                          color: AppColors.borderGrey,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      width: (savingGoalsModel.yourContribution /
                              savingGoalsModel.amounttoSave) *
                          100,
                      height: 10,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset('assets/svg/edit.svg')),
      ],
    );
  }
}

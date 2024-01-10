import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/utils/lists.dart';
import '../../../_global/widgets/app_bar_widget.dart';
import '../../store/profile_store.dart';

class CurrenciesPage extends StatelessWidget {
  const CurrenciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileStore = context.read<ProfileStore>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              final currency = currencyList[index];
              return Observer(builder: (context) {
                final isSelected = profileStore.selectedCurrencyIndex == index;
                return GestureDetector(
                  onTap: () => profileStore.setSelectedCurrency(index),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currency,
                        style: AppTextStyles.poppins14Black,
                      ),
                      if (isSelected)
                        const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.blue,
                        )
                    ],
                  ),
                );
              });
            },
            separatorBuilder: (context, index) => const SizedBox(height: 34),
            itemCount: currencyList.length),
      ),
    );
  }
}

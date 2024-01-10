import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../core/constants/colors.dart';
import '../../core/enums/main_page_enums.dart';
import '../budget/screens/budget_screen.dart';
import '../budget/store/budget_store.dart';
import '../home/screens/home_screen.dart';
import '../home/store/home_store.dart';
import '../home/store/navigation_store.dart';
import '../profile/screens/profile_screen.dart';
import '../profile/store/profile_store.dart';
import '../saving_goals/store/saving_goals_store.dart';
import '../transactions/screens/transaction_screen.dart';
import '../saving_goals/screens/saving_goals_screen.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<NavigationStore>(
        create: (_) => NavigationStore(),
      ),
      Provider<HomeStore>(
        create: (_) => HomeStore(),
      ),
      Provider<BudgetStore>(
        create: (_) => BudgetStore(),
      ),
      Provider<ProfileStore>(
        create: (_) => ProfileStore(),
      ),
      Provider<SavingGoalsStore>(
        create: (_) => SavingGoalsStore(),
      ),
    ], child: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationStore = context.read<NavigationStore>();
    return Scaffold(
      body: Observer(builder: (_) {
        final screen = navigationStore.currentScreen;
        switch (screen) {
          case ScreenType.HOME:
            return const HomeScreen();

          case ScreenType.BUDGET:
            return BudgetScreen();

          case ScreenType.TRANSACTIONS:
            return const TransactionScreen();

          case ScreenType.SAVINGGOALS:
            return SavingGoalsScreen();
          case ScreenType.PROFILE:
            return const ProfileScreen();
        }
      }),
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Observer(
          builder: (context) => BottomNavigationBar(
            elevation: 20,
            iconSize: 40,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.blue,
            unselectedItemColor: AppColors.borderGrey,
            currentIndex:
                ScreenType.values.indexOf(navigationStore.currentScreen),
            onTap: (index) {
              final selectedScreen = ScreenType.values[index];
              navigationStore.changeScreen(selectedScreen);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_outline_rounded),
                label: 'Budget',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows_rounded),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet_rounded),
                label: 'Savings',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundImage: AssetImage('assets/png/profile_picture.png'),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

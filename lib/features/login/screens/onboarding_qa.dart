import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';
import '../../../core/utils/lists.dart';
import '../../app/home.dart';

import '../widgets/main_button.dart';

class OnBoardingQA extends StatefulWidget {
  const OnBoardingQA({Key? key}) : super(key: key);

  @override
  State<OnBoardingQA> createState() => _OnBoardingQAState();
}

class _OnBoardingQAState extends State<OnBoardingQA> {
  @override
  void initState() {
    super.initState();
  }

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final countryController = TextEditingController();
  final currencyController = TextEditingController();

  double sliderVal = 17;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    amountController.dispose();
    countryController.dispose();
    currencyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Tell us more about you...',
                style: AppTextStyles.poppins30Blackbold,
              ),
              const SizedBox(height: 30),
              const Text(
                'My Name',
                style: AppTextStyles.poppins20Black,
              ),
              const SizedBox(height: 7),
              TextFieldWidget(nameController: nameController, typeName: 'Name'),
              const SizedBox(height: 20),
              const Text(
                'My Age is',
                style: AppTextStyles.poppins20Black,
              ),
              const SizedBox(height: 7),
              Slider(
                value: sliderVal,
                onChanged: (changedVal) {
                  setState(() {
                    sliderVal = changedVal;
                  });
                },
                divisions: 100,
                min: 1,
                max: 100,
                label: '${sliderVal.round()} years old',
              ),
              const SizedBox(height: 20),
              const Text(
                "I'm from",
                style: AppTextStyles.poppins20Black,
              ),
              const SizedBox(height: 7),
              DropDownWidget(
                controller: countryController,
                list: countryList,
                typeName: 'Country',
              ),
              const SizedBox(height: 20),
              const Text(
                'I use',
                style: AppTextStyles.poppins20Black,
              ),
              const SizedBox(height: 7),
              DropDownWidget(
                controller: currencyController,
                list: currencyList,
                typeName: 'Currency',
              ),
              const SizedBox(height: 30),
              const Text(
                'My Amount in Balance',
                style: AppTextStyles.poppins20Black,
              ),
              const SizedBox(height: 7),
              TextFieldWidget(
                  nameController: amountController, typeName: 'Amount'),
              const SizedBox(height: 60),
              MainButton(
                  action: () {
                    // final userModel = UserDetailsModel(
                    //     name: nameController.text,
                    //     age: sliderVal,
                    //     country: countryController.text,
                    //     currency: currencyController.text,
                    //     amount: double.parse(amountController.text));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const AppProviders()),
                        (route) => false);
                  },
                  buttonName: 'Continue'),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.nameController,
    required this.typeName,
    Key? key,
  }) : super(key: key);

  final TextEditingController nameController;
  final String typeName;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: nameController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Enter $typeName',
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    required this.controller,
    required this.list,
    required this.typeName,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final List<String> list;
  final String typeName;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 3,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownMenu(
        hintText: 'Select $typeName',
        trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
        controller: controller,
        menuStyle: MenuStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          elevation: const MaterialStatePropertyAll(10),
        ),
        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}

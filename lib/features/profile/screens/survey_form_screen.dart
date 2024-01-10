import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../core/utils/lists.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../../login/widgets/main_button.dart';
import '../store/profile_store.dart';

class SurveyFormScreen extends StatelessWidget {
  const SurveyFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileStore = context.read<ProfileStore>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Survey Form'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              VerticalQuestionWidget(
                questionNumText: 'Question 1',
                questionTitle: 'How often did you use our app?',
                list: question1,
              ),
              const SizedBox(height: 20),
              HorizontalQuestionWidget(
                questionNumText: 'Question 2',
                questionTitle: 'How easy was it to navigate the app?',
                leftText: 'EASY',
                rightText: 'DIFFICULT',
              ),
              const SizedBox(height: 20),
              VerticalQuestionWidget(
                questionNumText: 'Question 3',
                questionTitle:
                    'What features do you find most useful in our app? (Select all that apply)',
                list: question3,
              ),
              const SizedBox(height: 20),
              TextQuestionWidget(
                questionNumText: 'Question 4',
                questionTitle:
                    'Are there any features or functionalities that you think our app is missing? If yes, please describe.',
              ),
              const SizedBox(height: 20),
              HorizontalQuestionWidget(
                questionNumText: 'Question 5',
                questionTitle:
                    "How satisfied are you with the app's security measures?",
                leftText: 'Very satisfied',
                rightText: 'Dissatisfied',
              ),
              const SizedBox(height: 20),
              VerticalQuestionWidget(
                questionNumText: 'Question 6',
                questionTitle: 'Would you recommend our app to others?',
                list: question6,
              ),
              const SizedBox(height: 20),
              VerticalQuestionWidget(
                questionNumText: 'Question 7',
                questionTitle:
                    "How would you rate the app's customer support and responsiveness?",
                list: question7,
              ),
              const SizedBox(height: 20),
              TextQuestionWidget(
                questionNumText: 'Question 8',
                questionTitle:
                    'What improvements or changes would you suggest to enhance the user experience of our app?',
              ),
              const SizedBox(height: 20),
              TextQuestionWidget(
                questionNumText: 'Question 9',
                questionTitle:
                    'Have you encountered any technical issues or bugs while using the app? If yes, please provide details.',
              ),
              const SizedBox(height: 20),
              VerticalQuestionWidget(
                questionNumText: 'Question 10',
                questionTitle: "Overall, how satisfied are you with our app?",
                list: question10,
              ),
              const SizedBox(height: 30),
              MainButton(action: () {}, buttonName: 'Send'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class TextQuestionWidget extends StatelessWidget {
  TextQuestionWidget({
    required this.questionNumText,
    required this.questionTitle,
    Key? key,
  }) : super(key: key);

  String questionNumText;
  String questionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionNumText,
          style: AppTextStyles.poppins15Black,
        ),
        const SizedBox(height: 6),
        Text(
          questionTitle,
          style: AppTextStyles.poppins13Black,
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 116,
          child: TextField(
            maxLines: null,
            expands: true,
            style: AppTextStyles.poppins14Black,
            textAlignVertical: TextAlignVertical.top,
            onChanged: (val) {},
            decoration: InputDecoration(
              hintText: 'Write your notes...',
              hintStyle: AppTextStyles.poppins14Grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.borderGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.borderGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppColors.borderGrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalQuestionWidget extends StatelessWidget {
  HorizontalQuestionWidget({
    required this.questionNumText,
    required this.questionTitle,
    required this.leftText,
    required this.rightText,
    Key? key,
  }) : super(key: key);

  String questionNumText;
  String questionTitle;
  String leftText;
  String rightText;

  @override
  Widget build(BuildContext context) {
    final profileStore = context.read<ProfileStore>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionNumText,
          style: AppTextStyles.poppins15Black,
        ),
        const SizedBox(height: 6),
        Text(
          questionTitle,
          style: AppTextStyles.poppins13Black,
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 10,
          children: [
            for (int i = 5; i > 0; i--)
              Observer(
                builder: (context) {
                  final isSelected = profileStore.selectedAnsQuestion2 == i;
                  return GestureDetector(
                    onTap: () => profileStore.setQuestion2Ans(i),
                    child: Container(
                      alignment: Alignment.center,
                      width: 55,
                      height: 37,
                      decoration: BoxDecoration(
                          color: isSelected ? AppColors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.blue)),
                      child: Text(
                        i.toString(),
                        style: AppTextStyles.poppins15Black.copyWith(
                            color: isSelected ? Colors.white : AppColors.blue,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftText,
              style: AppTextStyles.poppins10White
                  .copyWith(color: AppColors.textGrey),
            ),
            Text(
              rightText,
              style: AppTextStyles.poppins10White
                  .copyWith(color: AppColors.textGrey),
            ),
          ],
        )
      ],
    );
  }
}

class VerticalQuestionWidget extends StatelessWidget {
  VerticalQuestionWidget({
    required this.list,
    required this.questionNumText,
    required this.questionTitle,
    Key? key,
  }) : super(key: key);

  String questionNumText;
  String questionTitle;
  List<String> list;

  @override
  Widget build(BuildContext context) {
    final profileStore = context.read<ProfileStore>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionNumText,
          style: AppTextStyles.poppins15Black,
        ),
        const SizedBox(height: 6),
        Text(
          questionTitle,
          style: AppTextStyles.poppins13Black,
        ),
        const SizedBox(height: 6),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final option = list[index];
              return Observer(builder: (context) {
                final selectedAns = profileStore.selectedAnsQuestion1;
                return Row(
                  children: [
                    Radio<int>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: selectedAns,
                      groupValue: index,
                      onChanged: (val) {
                        profileStore.setQuestion1Ans(index);
                      },
                    ),
                    Text(
                      option,
                      style: AppTextStyles.poppins13Black,
                    ),
                  ],
                );
              });
            },
            itemCount: list.length),
      ],
    );
  }
}

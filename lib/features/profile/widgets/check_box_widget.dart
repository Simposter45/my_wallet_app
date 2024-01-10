import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/styles.dart';
import '../store/profile_store.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    required this.text,
    required this.index,
    Key? key,
  }) : super(key: key);

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    final store = context.read<ProfileStore>();
    return Row(
      children: [
        Observer(
          builder: (_) => Checkbox(
            checkColor: Colors.white,
            value: store.selectedSubjects[index],
            shape: const CircleBorder(),
            onChanged: (value) {
              store.setSubjectSelected(value ?? false, index);
            },
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: AppTextStyles.poppins12Black,
        ),
      ],
    );
  }
}

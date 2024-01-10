import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../model/notifications_model.dart';
import '../store/home_store.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<HomeStore>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Notifiactions'),
      body: Observer(
        builder: (context) => ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Column(
            children: [
              Divider(height: 0),
            ],
          ),
          itemCount: store.notificationItems.length,
          itemBuilder: (context, index) {
            final notificationModel = store.notificationItems[index];

            return NotificationCard(
                notificationModel: notificationModel, store: store);
          },
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.notificationModel,
    required this.store,
    Key? key,
  }) : super(key: key);

  final NotificationModel notificationModel;
  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: notificationModel.isread
              ? Colors.white
              : AppColors.blue.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.borderGrey,
              backgroundImage: AssetImage('assets/png/profile_picture.png'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'You received a payment of',
                            style: AppTextStyles.poppins14Black),
                        TextSpan(
                            text: ' \$${notificationModel.amount}',
                            style: AppTextStyles.poppins14Blue
                                .copyWith(fontWeight: FontWeight.bold)),
                        const TextSpan(
                            text: ' from ',
                            style: AppTextStyles.poppins14Black),
                        TextSpan(
                            text: notificationModel.payerName,
                            style: AppTextStyles.poppins14BlackBold),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'TIME',
                    style: AppTextStyles.poppins14Grey.copyWith(fontSize: 12),
                  )
                ],
              ),
            ),
            PopupMenuButton(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (value) {
                if (value == 0) {
                  store.setIsRead(notificationModel);
                } else {
                  store.deleteNotifications(notificationModel);
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 0,
                    child: Text('Mark as read'),
                  ),
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Delete'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}

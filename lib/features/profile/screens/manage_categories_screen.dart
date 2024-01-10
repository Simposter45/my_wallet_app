import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../store/profile_store.dart';

class ManageCategoriesScreen extends StatelessWidget {
  ManageCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<ProfileStore>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Categories'),
      body: Observer(
        builder: (context) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: store.categoryList.length,
              itemBuilder: (context, index) {
                final category = store.categoryList[index];
                return Row(
                  children: [
                    Text(
                      category.category,
                      style: AppTextStyles.poppins16Black,
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Provider.value(
                                    value: store, child: CategoryDialog());
                              });
                        },
                        icon: SvgPicture.asset('assets/svg/edit.svg')),
                    IconButton(
                      onPressed: () {
                        store.deleteCategory(category);
                      },
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Provider.value(value: store, child: CategoryDialog());
              });
        },
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CategoryDialog extends StatelessWidget {
  CategoryDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<ProfileStore>();
    return AlertDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text(
        'Create new category',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) => store.category = value,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: AppColors.borderGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: AppColors.blue),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    store.addCatergories(store.category);
                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.green)),
                  child: Text('Save',
                      style: AppTextStyles.poppins20Whitebold
                          .copyWith(fontSize: 14)),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child:
                      const Text('Cancel', style: AppTextStyles.poppins14Black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

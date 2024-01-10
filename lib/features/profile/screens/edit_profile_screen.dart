import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/styles.dart';
import '../../../core/constants/colors.dart';
import '../../_global/widgets/app_bar_widget.dart';
import '../store/profile_store.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = context.read<ProfileStore>();
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(
          title: store.isEditMode ? 'Edit Profile' : 'Profiles',
          action: store.toggleEditMode,
          actionName: store.isEditMode ? 'Save' : 'Edit',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.borderGrey,
                    backgroundImage:
                        AssetImage('assets/png/profile_picture.png'),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              buildTextField('Name', 'Enter Name', store),
              const SizedBox(height: 16),
              buildTextField('Location', 'Enter Location', store),
              const SizedBox(height: 16),
              Text(
                'Mobile Number',
                style: AppTextStyles.poppins20Black.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 6),
              IntlPhoneField(
                enabled: store.isEditMode,
                autofocus: store.isEditMode,
                decoration: InputDecoration(
                  hintText: 'Enter Mobile Number',
                  fillColor: AppColors.lightGrey,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {},
              ),
              const SizedBox(height: 16),
              buildTextField('Email', 'Enter Email', store),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, ProfileStore store) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.poppins20Black.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 6),
        TextField(
          enabled: store.isEditMode,
          autofocus: store.isEditMode,

          style: AppTextStyles.poppins16Black,
          // onChanged: (value) => amount = double.parse(value),
          decoration: InputDecoration(
            // prefix:
            hintText: hint,
            fillColor: AppColors.lightGrey,
            filled: true,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}

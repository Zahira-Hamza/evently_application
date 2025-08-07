import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/app_language_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppLanguageProvider>(context);
    String currentLang = langProvider.appLanguage;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LanguageOption(
            title: tr('english'),
            isSelected: currentLang == 'en',
            onTap: () {
              context.setLocale(const Locale('en'));
              langProvider.changeLanguage('en');
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          LanguageOption(
            title: tr('arabic'),
            isSelected: currentLang == 'ar',
            onTap: () {
              context.setLocale(const Locale('ar'));
              langProvider.changeLanguage('ar');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
            color: isSelected ? AppColors.bluePrimaryColor : Colors.grey),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? Icon(Icons.check_circle, color: AppColors.bluePrimaryColor)
          : null,
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/app_theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr('theme'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          buildThemeOption(context, provider, ThemeMode.light, tr('light')),
          const SizedBox(height: 8),
          buildThemeOption(context, provider, ThemeMode.dark, tr('dark')),
        ],
      ),
    );
  }

  Widget buildThemeOption(
    BuildContext context,
    AppThemeProvider provider,
    ThemeMode themeMode,
    String title,
  ) {
    bool isSelected = provider.appTheme == themeMode;
    return InkWell(
      onTap: () {
        provider.changeTheme(themeMode);
        Navigator.pop(context); // يقفل الـ Bottom Sheet بعد الاختيار
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(Icons.check, color: Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
    );
  }
}

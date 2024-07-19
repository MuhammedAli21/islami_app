import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_v1/app_colors.dart';
import 'package:islami_v1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
        margin: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? getSelectedItemWidet(AppLocalizations.of(context)!.dark)
                  : getUnselectdItem(AppLocalizations.of(context)!.dark)),
          const SizedBox(height: 10),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDark()
                  ? getUnselectdItem(AppLocalizations.of(context)!.light)
                  : getSelectedItemWidet(AppLocalizations.of(context)!.light)),
        ]));
  }

  Widget getSelectedItemWidet(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primaryLightColor,
              ),
        ),
        const Icon(
          Icons.check,
          color: AppColors.primaryLightColor,
          size: 30,
        )
      ],
    );
  }

  Widget getUnselectdItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.whiteColor,
              ),
        )
      ],
    );
  }
}

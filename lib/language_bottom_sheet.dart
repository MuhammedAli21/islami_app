import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_v1/app_colors.dart';
import 'package:islami_v1/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
        margin: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidet(AppLocalizations.of(context)!.english)
                  : getUnselectdItem(AppLocalizations.of(context)!.english)),
          const SizedBox(height: 10),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemWidet(AppLocalizations.of(context)!.arabic)
                  : getUnselectdItem(AppLocalizations.of(context)!.arabic)),
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

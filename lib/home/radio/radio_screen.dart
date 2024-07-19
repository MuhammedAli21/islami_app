import 'package:flutter/material.dart';
import 'package:islami_v1/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/radio_logo.png'),
        Text(
          "إذاعة القرآن الكريم",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_previous,
                size: 50,
              ),
              color: provider.isDark()
                  ? AppColors.yellowColor
                  : AppColors.primaryLightColor,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  size: 50,
                ),
                color: provider.isDark()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.skip_next,
                  size: 50,
                ),
                color: provider.isDark()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor),
          ],
        ),
      ],
    );
  }
}

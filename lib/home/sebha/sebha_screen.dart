import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../providers/app_config_provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double turn = 0.0;
  int count = 0;

  int tempCount = 0;
  List<String> azkar = [
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر',
    'سبحان الله',
  ];
  String tsbeh = 'سبحان الله';
  int i = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Center(
      child: Stack(children: [
        Positioned(
          bottom: 500,
          left: 80,
          child: Image.asset('assets/images/head of seb7a.png'),
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            AnimatedRotation(
                duration: const Duration(seconds: 1),
                turns: turn,
                child: InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      setState(() {
                        turn += 0.1;
                        count++;
                        while (count > 33) {
                          tsbeh = azkar[i++];
                          count = 0;
                          if (i == 4) {
                            i = 0;
                          }
                        }
                      });
                    },
                    child: Image.asset('assets/images/body of seb7a.png'))),
            const SizedBox(
              height: 50,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: provider.isDark()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
              ),
              child: Text('$count',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.blackColor)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: provider.isDark()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
              ),
              child: Text(
                tsbeh,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.blackColor),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

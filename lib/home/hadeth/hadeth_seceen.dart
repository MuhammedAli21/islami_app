import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_v1/app_colors.dart';
import 'package:islami_v1/home/hadeth/item_hadeth_name.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class HadethSeceen extends StatefulWidget {
  const HadethSeceen({super.key});

  @override
  State<HadethSeceen> createState() => _HadethSeceenState();
}

class _HadethSeceenState extends State<HadethSeceen> {
  List<Hadeth> ahadthList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    loadHadethFile();

    return Column(
      children: [
        Container(
          color: Colors.transparent,
          child: Expanded(
              flex: 1, child: Image.asset('assets/images/hadeth_logo.png')),
        ),
        Divider(
          color: provider.isDark()
              ? AppColors.yellowColor
              : AppColors.primaryLightColor,
          thickness: 4,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Divider(
          color: AppColors.primaryLightColor,
          thickness: 4,
        ),
        Expanded(
          flex: 2,
          child: Expanded(
            child: ahadthList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryLightColor,
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: provider.isDark()
                            ? AppColors.yellowColor
                            : AppColors.primaryLightColor,
                        thickness: 2,
                      );
                    },
                    //index => رقم الايتم اللي بتعرض جوا ال لست
                    itemBuilder: (context, index) {
                      return ItemHadethName(hadeth: ahadthList[index]);
                    },
                    itemCount: 50,
                  ),
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadthList.add(hadeth);
      setState(() {});
    }
  }
}

//data class
class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}

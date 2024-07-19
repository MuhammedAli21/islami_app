import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_v1/app_colors.dart';
import 'package:islami_v1/home/quran/item_sura_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "Sura_Details_Screen";

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(
      children: [
        provider.isDark()
            ? Image.asset(
                'assets/images/background_dark.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/bg3.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge, // gets lightmode of darkmode
            ),
          ),
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryDarkColor,
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * .06,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * .02,
                  ),
                  decoration: BoxDecoration(
                    color: provider.isDark()
                        ? AppColors.primaryDarkColor
                        : Colors.white60,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemSuraDetails(
                        content: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
        )
      ],
    );
  }

  void loadFile(int index) async {
    //future of string = النتايج مش بتجي في نفس اللحظة وهتاخد وقت
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> line = content.split('\n');
    verses = line;
    setState(() {});
  }
}

//data class
class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}

import 'package:flutter/material.dart';
import 'package:islami_v1/app_colors.dart';
import 'package:islami_v1/home/hadeth/hadeth_seceen.dart';
import 'package:islami_v1/home/hadeth/item_hadeth_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "Hadeth_Details_Screen";

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
              args.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge, // gets lightmode of darkmode
            ),
          ),
          body: Container(
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
                return ItemHadethDetails(
                  content: args.content[index],
                );
              },
              itemCount: args.content.length,
            ),
          ),
        )
      ],
    );
  }
}

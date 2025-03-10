import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/providers/theme_provider.dart';
import 'package:mysteriouscoder/presentation/widgets/global_widgets.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/static_assets.dart';
import '../../../models/nav_items.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/styles.dart';
import '../../theme_controller.dart';

class AppBarWeb extends StatelessWidget {
  final Function(int) onNavItemTap;
  final double w;

  const AppBarWeb({super.key, required this.w, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      width: w,
      height: const Size.fromHeight(kToolbarHeight).height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage(StaticAssets.logo),
              radius: 20,
            ),
          ),
          const SizedBox(width: 10),
          Text(Constants.title,
              style: reusableTextStyle(
                  color: Theme.of(context).colorScheme.surface)),
          const Spacer(flex: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: navItems
                .map((item) {
                  int index = navItems.indexOf(item);

                     return MouseRegion(
                          onEnter: (_) {
                            provider.hoveredItem=index;
                          },
                          onExit: (_) {
                            provider.hoveredItem=-1;
                          },
                        child: InkWell(
                          onTap: () {
                            onNavItemTap(index);
                          },
                          child: Container(
                              width: 120,
                              height: 40,
                              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10),

                              decoration: BoxDecoration(
                                gradient: provider.hoveredItem==index? provider.themeMode==ThemeMode.light ? grayBlack:grayWhite :LinearGradient(colors: [Colors.transparent, Colors.transparent]),
                                // gradient: LinearGradient(colors: provider.hoveredItem==index ? [
                                //   const Color(0xff6a11cb), const Color(0xff2575fc)
                                // ]: [
                                //   Colors.transparent, Colors.transparent
                                // ]),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Center(child: Text(item.title, style: reusableTextStyle(fontSize: 16,color: Theme.of(context).colorScheme.surface)))),
                        ),
                      );
  }
                )
                .toList(),
          ),
          spacerW(),
          ThemeController(),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}

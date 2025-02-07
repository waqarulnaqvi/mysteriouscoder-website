import 'package:flutter/material.dart';
import 'package:mysteriouscoder/domain/data/social_media_icons.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/widgets/drawer/custom_drawer.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/mobile/app_bar_mobile.dart';
import 'package:mysteriouscoder/presentation/widgets/typing_effect.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/global_widgets.dart';
import 'package:provider/provider.dart';
import '../../shared/provider/theme_provider.dart';
import '../../shared/styles.dart';
import '../widgets/layout/common/about_me.dart';
import '../widgets/layout/common/main_part.dart';
import '../widgets/layout/web/app_bar_web.dart';
import '../widgets/clipper/wave_container_clipper.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.surface,
      endDrawer: CustomDrawer(
        w: w * 0.75,
        h: h,
      ),
      endDrawerEnableOpenDragGesture: w <Constants.maxTabletWidth? true:false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ResponsiveLayout(
            mobile: AppBarMobile(scaffoldKey: _scaffoldKey),
            tablet: AppBarMobile(scaffoldKey: _scaffoldKey),
            desktop: AppBarWeb(w: w,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // MainPart(w: w, h: h, ),
            // AboutMe(w: w),

          ],
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/widgets/drawer/custom_drawer.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/about_us.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/contact_us.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/projects.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/common/services.dart';
import 'package:mysteriouscoder/presentation/widgets/layout/mobile/app_bar_mobile.dart';
import 'package:mysteriouscoder/presentation/widgets/static_image.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import 'package:provider/provider.dart';
import '../../shared/provider/theme_provider.dart';
import '../widgets/layout/common/footer.dart';
import '../widgets/layout/common/main_part.dart';
import '../widgets/layout/web/app_bar_web.dart';
import '../widgets/clipper/wave_container_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var provider =Provider.of<ThemeProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
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
       body:  Stack(
          children: [
            // Background with ColorFiltered
            ColorFiltered(
              colorFilter: provider.mode == ThemeMode.light
                  ? ColorFilter.mode(
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                  BlendMode.darken)
                  : ColorFilter.mode(Colors.transparent, BlendMode.dst),
              child: Image.asset(
                provider.mode == ThemeMode.dark
                    ? StaticImage.darkTheme
                    : StaticImage.lightTheme,
                fit: BoxFit.cover,
                width: w,
                height: h,
              ),
            ),

            // Foreground Content (Column)
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ///Main Part
                  MainPart(w: w, h: h),
                  CurvedDivider(),

                  ///About Us Page
                  AboutUs(w: w),
                  CurvedDivider(),

                  ///Services
                  Services(w: w, h: h),
                  CurvedDivider(),

                  ///Projects
                  Projects(w: w, h: h),
                  CurvedDivider(),

                  ///Contact Us
                  ContactUs(w:w,h:h),
                  CurvedDivider(),

                  ///Footer
                  Footer(w: w,h:h),
                ],
              ),
            ),
          ],
        )

    );
  }
}



class CurvedDivider extends StatelessWidget {
  const CurvedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedDividerClipper(),
      child: Container(
        height: 50, // Adjust height as needed
        color: Theme.of(context).colorScheme.onSurface, // Adjust color as needed
      ),
    );
  }
}

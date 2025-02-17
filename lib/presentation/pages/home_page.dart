import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/responsive_layout.dart';
import 'package:mysteriouscoder/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../core/constants.dart';
import '../widgets/clipper/curved_divider_clipper.dart';
import '../widgets/drawer/custom_drawer.dart';
import '../widgets/layout/common/about_us.dart';
import '../widgets/layout/common/contact_us.dart';
import '../widgets/layout/common/footer.dart';
import '../widgets/layout/common/main_part.dart';
import '../widgets/layout/common/projects.dart';
import '../widgets/layout/common/services.dart';
import '../widgets/layout/mobile/app_bar_mobile.dart';
import '../widgets/layout/web/app_bar_web.dart';
import '../widgets/static_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());
  // bool _isLoading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(milliseconds: 2500), () {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        endDrawer: CustomDrawer(
          onNavItemTap: (int navIndex) {
            scrollToSection(navIndex);
            _scaffoldKey.currentState
                ?.closeEndDrawer(); // Close drawer after navigation
          },
          w: w * 0.75,
          h: h,
        ),
        endDrawerEnableOpenDragGesture:
            w < Constants.maxTabletWidth ? true : false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ResponsiveLayout(
            mobile: AppBarMobile(scaffoldKey: _scaffoldKey),
            tablet: AppBarMobile(scaffoldKey: _scaffoldKey),
            desktop: AppBarWeb(
              w: w,
              onNavItemTap: (int navIndex) {
                navIndex == 0
                    ? scrollToSection(navIndex)
                    : scrollToSection(navIndex + 1);
              },
            ),
          ),
        ),
        body: Stack(
          children: [
            // Background with ColorFiltered
            ColorFiltered(
              colorFilter: provider.mode == ThemeMode.light
                  ? ColorFilter.mode(
                      Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.2),
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
                children: [
                  ///Main Part
                  MainPart(
                    key: navbarKeys.first,
                    w: w,
                    h: h,
                    onTap: () {
                      scrollToSection(4);
                    },
                  ),
                  CurvedDivider(),

                  ///About Us Page
                  AboutUs(
                    w: w,
                    key: navbarKeys[1],
                  ),
                  CurvedDivider(),

                  ///Services
                  Services(key: navbarKeys[2], w: w, h: h),
                  CurvedDivider(),

                  ///Projects
                  Projects(key: navbarKeys[3], w: w, h: h),
                  CurvedDivider(),

                  ///Contact Us
                  ContactUs(key: navbarKeys[4], w: w, h: h),

                  ///Footer
                  Footer(
                    w: w,
                    h: h,
                    serviceTap: () {
                      scrollToSection(2);
                    },
                    aboutUsTap: () {
                      scrollToSection(1);
                    },
                  ),
                ],
              ),
            ),

            // SpinKit Loading Indicator
            // if(_isLoading)
            // Container(
            //   width: w,
            //   height: h,
            //   color:  Theme.of(context)
            //       .colorScheme
            //       .primary
            //       .withValues(alpha: 0.2),
            //   child: Center(
            //     child: SpinKitFadingCircle(color: Colors.black.withValues(alpha: 0.2), size: 50.0),
            //   )
            // )
          ],
        ));
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
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
        color:
            Theme.of(context).colorScheme.onSurface, // Adjust color as needed
      ),
    );
  }
}



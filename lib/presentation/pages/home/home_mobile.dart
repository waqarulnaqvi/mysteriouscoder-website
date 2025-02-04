import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/drawer/custom_drawer.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import '../../../shared/global.dart';
import '../../../shared/styles.dart';

class HomeMobile extends StatefulWidget {
  HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      endDrawer: CustomDrawer(
        w: w * 0.75,
        h: h,
      ),
      endDrawerEnableOpenDragGesture: false,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(6.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/mysteriouscoder_logo.png'),
          radius: 20,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(Constants.title,style: reusableTextStyle(color:  isDark? Colors.white : Colors.black)),
      actions: [
        IconButton(
            onPressed: () {
              isDark = !isDark;
              setState(() {});
            },
            icon: Image(image: AssetImage(isDark? "assets/icons/light_theme.png" :"assets/icons/dark_icon.png"),
              width: 30,
              height: 30,
              color: isDark? Colors.white : Colors.black,
            )
        ),
        const SizedBox(width: 5),
        InkWell(
            onTap: (){
              _scaffoldKey.currentState!.openEndDrawer();
            },
            child: Image(image: const AssetImage("assets/icons/menu.png"),width: 30,height: 30,color: isDark? Colors.white : Colors.black,)),
      ],
    );
  }
}

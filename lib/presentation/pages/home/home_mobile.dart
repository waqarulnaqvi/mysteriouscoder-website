import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/widgets/drawer/custom_drawer.dart';
import '../../../shared/global.dart';
import '../../../shared/styles.dart';


class HomeMobile extends StatelessWidget {
   HomeMobile({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      endDrawer: CustomDrawer(w: w*0.75,h: h,),
      endDrawerEnableOpenDragGesture: false,
      appBar: _appBar(),

    body: SingleChildScrollView(
      child: Column(
        children:<Widget> [

        ],
      ),
    ),
    );
  }



 AppBar _appBar()
  {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(6.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/mysteriouscoder_logo.png'),
          radius: 20,
        ),
      ),
      foregroundColor: Colors.white,
      backgroundColor: dark,
      title: Text('Mysterious Coder',style: reusableTextStyle()),
      actions: [
        InkWell(
            onTap: (){
              _scaffoldKey.currentState!.openEndDrawer();
            },
            child: const Image(image: AssetImage("assets/icons/menu.png"),color: Colors.white,width: 30,height: 30,)),
      ],
    );
  }
}

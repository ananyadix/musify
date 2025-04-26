import 'package:flutter/material.dart';
import 'package:musify/common/helper/isDarkMode.dart';
import 'package:musify/common/widgets/appBar.dart';
import 'package:musify/core/configs/theme/app_color.dart';
import 'package:musify/presentation/pages/profile/profilePage.dart';
import 'package:musify/presentation/widgets/playlist.dart';
import 'package:musify/presentation/widgets/songsSideScroll.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(hideBack: true,action: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(BuildContext) => Profilepage()));
      }, icon: Icon(Icons.person)),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _homeCard(),
              _tabs(),
              SizedBox(
                height: 220,
                child: TabBarView(controller: _tabController
                    ,children: [
                  const Songssidescroll(),
                  Container(),
                  Container(),
                  Container(),
                  Container()
                ]),
              ),
              const Playlist()
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeCard(){
    return Center(
      child: Container(
        height: 150,
        child: Image.asset("assets/images/Group 4.png"),
      ),
    );
  }

  Widget _tabs(){
    return Container(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: _tabController,
          isScrollable: true,
          labelColor: context.isDarkMode?Colors.white:Colors.black,
          indicatorColor: AppColors.primary,
          padding: EdgeInsets.symmetric(vertical: 20),
          tabs: [
        Text("Music",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
        Text("News",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
        Text("Videos",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
        Text("Artists",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
        Text("Podcasts",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16))
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:githubdemo/app/request.dart';
import 'package:githubdemo/home/home_banner.dart';
import 'package:githubdemo/home/home_model.dart';
import 'package:githubdemo/home/novel_first_hybird_card.dart';
import 'package:githubdemo/home/novel_four_grid_view.dart';
import 'package:githubdemo/home/novel_normal_card.dart';
import 'package:githubdemo/home/novel_second_hybird_card.dart';
import 'package:githubdemo/utility/toast.dart';
import 'home_menu.dart';

enum HomeListType{
  excellent,
  male,
  female,
  cartoon,
}

class HomeListView extends StatefulWidget{
  final HomeListType type;
  HomeListView(this.type);
  @override
  State<StatefulWidget> createState() => HomeListViewState();
}

//AutomaticKeepAliveClientMixin：使widget从tree中remove后仍然保存相关变量
class HomeListViewState extends State<HomeListView> with AutomaticKeepAliveClientMixin{
  List<CarouselInfo> carouselInfos = [];
  int pageIndex = 1;
  List<HomeModule> modules = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  
  Future<void> fetchData() async{
    try{
      var action;
      switch (this.widget.type){
        case HomeListType.excellent:
          action = 'home_excellent';
          break;
        case HomeListType.female:
          action = 'home_female';
          break;
        case HomeListType.male:
          action = 'home_male';
          break;
        case HomeListType.cartoon:
          action = 'home_cartoon';
          break;
        default:
          break;
      }
      var responseJson = await Request.get(action: action);
      List moduleData = responseJson['module'];
      List<HomeModule> modules = [];
      moduleData.forEach((element) { 
        modules.add(HomeModule.fromJson(element));
      });
      setState(() {
        this.modules = modules;
        this.carouselInfos = carouselInfos;
      });
    }catch(e){
      Toast.show(e.toString());
    }
  }
  Widget bookCardWithInfo(HomeModule module){
    late Widget card;
    switch (module.style){
      case 1:
        card = NovelFourGridView(module);
        break;
      case 2:
        card = NovelSecondHybirdCard(module);
        break;
      case 3:
        card = NovelFirsthybirdCard(module);
        break;
      case 4:
        card = NovelNormalCard(module);
        break;
    }
    return card;
  }
  Widget buildModule(BuildContext context,HomeModule module){
    print('dfnai:${module.carousels}');
    if (module.carousels != null){
      return HomeBanner(module.carousels!);
    }else if (module.menus != null){
      return HomeMenu(module.menus!);
    }else if (module.books != null){
      return bookCardWithInfo(module);
    }


    return Container();
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return Container(
      child:RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
            itemCount: modules.length,
            itemBuilder: (BuildContext context,int index){
              return buildModule(context, modules[index]);
            }
        ),
      ),
    );
  }




}
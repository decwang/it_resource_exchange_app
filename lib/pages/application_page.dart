import 'package:flutter/material.dart';
import 'package:it_resource_exchange_app/common/constant.dart' show AppColors;
import 'package:it_resource_exchange_app/routes/it_router.dart';
import 'package:it_resource_exchange_app/routes/routes.dart';
import 'classify/classify_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';
import 'movie/movie_cate_list_page.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  int page = 0;
  String title = '首页';
  PageController pageController;
  IconButton _searchBtn;

  //定义底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
      backgroundColor: AppColors.PrimaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_library),
      title: Text('娱乐'),
      backgroundColor: AppColors.PrimaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.tune),
      title: Text('学习'),
      backgroundColor: AppColors.PrimaryColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的'),
      backgroundColor: AppColors.PrimaryColor,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchBtn = IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        ITRouter.push(context, Routes.movieSearchPage, {});
      },
    );
    pageController = PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = this.page != 1 ? [] : [_searchBtn];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        actions: actions,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),

        /// 去除滑动手势
        children: <Widget>[
          HomePage(),
          MovieCateListPage(),
          ClassifyPage(),
          ProfilePage()
        ],
        controller: pageController,
        onPageChanged: (int index) {
          onPageChanged(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomTabs,
        currentIndex: page,
        fixedColor: AppColors.PrimaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          onTap(index);
        },
      ),
    );
  }

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
      switch (page) {
        case 0:
          title = "首页";
          break;
        case 1:
          title = "娱乐";
          break;
        case 2:
          title = "学习";
          break;
        case 3:
          title = "我的";
          break;
      }
    });
  }
}

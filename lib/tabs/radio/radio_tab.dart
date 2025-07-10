import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/tabs/radio/radio_tab_bar_view.dart';
import 'package:islami_app/tabs/radio/reciters_tab_bar_view.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 40,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppTheme.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              indicator: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(25.0),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              unselectedLabelStyle: textTheme.titleLarge!.copyWith(
                color: AppTheme.white,
              ),
              labelStyle: textTheme.titleLarge!.copyWith(color: AppTheme.black),
              tabs: [Text('Radio'), Text('Reciters')],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [RadioTabBarView(), RecitersTabBarView()],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/hourly_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/const/status_level.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<StatModel>> fetchData() async {
    final statModels = await StatRepository.fetchData();

    StatModel stat = statModels[0];
    print(stat.busan);

    return statModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: const MainDrawer(),
      body: FutureBuilder<List<StatModel>>(
          future: fetchData(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasError) {
              return Center(
                child: Text("에러가 있습니다."),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<StatModel> stats = snapshot.data!;

            return CustomScrollView(
              slivers: [
                MainAppBar(
                  stat: stats[0],
                  status: statusLevel[0],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      CategoryCard(),
                      SizedBox(height: 16.0),
                      HourlyCard(),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

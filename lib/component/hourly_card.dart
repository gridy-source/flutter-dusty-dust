import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/main_card.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  final Color lightColor;
  final Color darkColor;
  final String category;
  final List<StatModel> stats;
  final String region;

  const HourlyCard({
    required this.lightColor,
    required this.darkColor,
    required this.category,
    required this.stats,
    required this.region,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainCard(
      backgroundColor: lightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardTitle(
            title:
                "시간별 ${DataUtils.getItemCodeKrString(itemCode: stats.first.itemCode)}",
            backgroundColor: darkColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              children: stats
                  .map(
                    (stat) => renderRow(stat: stat),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Padding renderRow({required StatModel stat}) {
    final status = DataUtils.getCurrentStatusFromStatAndItemCode(
      value: stat.getLevelFromRegion(region),
      itemCode: stat.itemCode,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${stat.dateTime.hour}시",
            ),
          ),
          Expanded(
            child: Image.asset(
              status.imagePath,
              height: 20.0,
            ),
          ),
          Expanded(
            child: Text(
              status.label,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}

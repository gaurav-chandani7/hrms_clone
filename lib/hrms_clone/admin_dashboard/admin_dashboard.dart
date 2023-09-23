import 'package:flutter/material.dart';
import 'package:hrms_clone/hrms_clone/admin_dashboard/components/project_list.dart';
import 'package:hrms_clone/hrms_clone/admin_dashboard/components/status_change_banner.dart';
import '../../core/utils.dart';
import '../../home_page.dart';
import 'components/detail_banner.dart';

class AdminDashboard extends StatelessWidget {
  final bool showMenuStatus;
  const AdminDashboard({super.key, required this.showMenuStatus});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Spacing().verticalSpace(context, 0.025),
      Text(
        'Welcome User!',
        style: txtStyle(size: 20, weight: FontWeight.bold),
      ),
      Spacing().verticalSpace(context, 0.04),
      ...bannerList
          .map((e) => DetailBannerWidget(
                e: e,
              ))
          .toList(),
      ...statusChangeBannerList
          .map(
            (e) => StatusChangeBannerWidget(e: e),
          )
          .toList(),
      const ProjectList(),
      Spacing().verticalSpace(context, 0.1),
    ]);
  }
}

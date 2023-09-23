import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_clone/hrms_clone/view_more_projects/components/member_detail_vert_list.dart';
import '../../core/app_widgets.dart';
import '../../core/components/popup_menu/domain/show_menu_cubit.dart';
import '../../core/utils.dart';
import '../project_detail_&_member/core/components.dart';
import '../project_detail_&_member/domain/select_timeline_cubit.dart';
import '../project_detail_&_member/domain/show_priority_cubit.dart';
import 'components/task_list.dart';

class ClientProfile extends StatefulWidget {
  const ClientProfile({super.key});

  @override
  State<ClientProfile> createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  ScrollController scrollController = ScrollController();
  TextEditingController editingController = TextEditingController();
  FocusNode textEditNode = FocusNode();
  int timelineIndex = 100;
  String? status;
  int index = 0;
  bool saveTimelineState = false;

  @override
  Widget build(BuildContext context) {
    final showMenuStatus = context.watch<ShowMenuCubit>().state;

    return AppWidgets().appScaffold(
        context: context,
        showMenuStatus: showMenuStatus,
        controller: scrollController,
        onClick: () {
          context.read<ShowMenuCubit>().hideMenu();
          context.read<ShowPriorityCubit>().hideState();
          if (editingController.text.isNotEmpty) {
            context.read<EditTimelineCubit>().editTimeline(
                timeline: editingController.text, index: timelineIndex);
          }

          context.read<TextBoxInplaceOfTextCubit>().toggleState(100);
          context.read<SelectedTimelinesCubit>().removeAll();
        },
        children: [
          Spacing().verticalSpace(context, 0.02),
          Row(children: [
            Text(
              'Profile',
              style: txtStyle(size: 18, weight: FontWeight.w600),
            ),
          ]),
          Spacing().verticalSpace(context, 0.04),
          Components().detailCard(
              context: context,
              padWid: 0.05,
              padHeight: 0.04,
              alignment: CrossAxisAlignment.center,
              children: [
                Spacing().horizontalSpace(context, 1),
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/member_list/download.jpg'),
                  radius: 50,
                ),
                Spacing().verticalSpace(context, 0.02),
                Text(
                  'Global Technologies',
                  style: txtStyle(size: 22, weight: FontWeight.w600),
                ),
                Spacing().verticalSpace(context, 0.018),
                Text(
                  'Barry Cuda',
                  style: txtStyle(size: 14, weight: FontWeight.w500),
                ),
                Spacing().verticalSpace(context, 0.01),
                Text(
                  'CEO',
                  style: txtStyle(size: 14, weight: FontWeight.w200),
                ),
                Spacing().verticalSpace(context, 0.02),
                Text(
                  'Employee ID: CLT-0001',
                  style: txtStyle(size: 16, weight: FontWeight.w500),
                ),
                Spacing().verticalSpace(context, 0.04),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink)),
                    onPressed: () {},
                    child: const Text('Send Message')),
                Spacing().verticalSpace(context, 0.02),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ...List.generate(
                    35,
                    (index) => Padding(
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        width: 6,
                        height: 2,
                        color: const Color.fromARGB(255, 122, 120, 120),
                      ),
                    ),
                  ).toList()
                ]),
                Spacing().verticalSpace(context, 0.02),
                bioItem(
                    field: 'Phone',
                    child: Text(
                      '9876543210',
                      style: txtStyle(color: Colors.blue),
                    )),
                bioItem(
                    field: 'Email',
                    child: Text(
                      'barrycuda@example.com',
                      style: txtStyle(color: Colors.blue),
                    )),
                bioItem(field: 'Birthday', child: const Text('2nd August')),
                bioItem(
                    field: 'Address',
                    child: const Text('5754 Airport Rd, Coosada, AL, 36020')),
                bioItem(field: 'Phone', child: const Text('9876543210')),
              ]),
          Components().detailCard(
              context: context,
              padWid: 0.0,
              padHeight: 0.04,
              alignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      index = 0;
                    }),
                    child: optionItem(
                        title: 'Projects',
                        boxColor: index == 0
                            ? const Color.fromARGB(255, 214, 211, 211)
                            : Colors.white,
                        indColor: index == 0 ? Colors.orange : Colors.white),
                  ),
                ]),
                Row(children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      index = 1;
                    }),
                    child: optionItem(
                        title: 'Tasks',
                        boxColor: index == 1
                            ? const Color.fromARGB(255, 214, 211, 211)
                            : Colors.white,
                        indColor: index == 1 ? Colors.orange : Colors.white),
                  ),
                ]),
              ]),
          AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              child: (() {
                if (index == 0) {
                  return const MemberDetailVertList();
                } else {
                  return Column(children: [
                    TaskList(
                      textEditNode: textEditNode,
                      editingController: editingController,
                    ),
                  ]);
                }
              }())),
        ]);
  }

  Widget bioItem({required String field, required Widget child}) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: Sizes().ratioWithScrHeight(context, 0.01),
            horizontal: Sizes().ratioWithScrWidth(context, 0.02)),
        child: Row(children: [
          SizedBox(
              width: Sizes().ratioWithScrWidth(context, 0.25),
              child: Text('$field:')),
          SizedBox(
              width: Sizes().ratioWithScrWidth(context, 0.5), child: child),
        ]),
      );

  Widget optionItem({
    required String title,
    required Color boxColor,
    required Color indColor,
  }) =>
      Stack(
        children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              color: boxColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Sizes().ratioWithScrHeight(context, 0.015),
                    horizontal: Sizes().ratioWithScrWidth(context, 0.06)),
                child: Text(title,
                    style: txtStyle(weight: FontWeight.w600, height: 1.4)),
              )),
          Transform(
            transform: Matrix4.skewY(40 / 180 * pi),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: 4,
              height: Sizes().ratioWithScrHeight(context, 0.03),
              color: indColor,
            ),
          ),
          Positioned(
            top: Sizes().ratioWithScrHeight(context, 0.02),
            child: Transform(
              transform: Matrix4.skewY(-40 / 180 * pi),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: 4,
                height: Sizes().ratioWithScrHeight(context, 0.03),
                color: indColor,
              ),
            ),
          )
        ],
      );
  Widget tabWithRedIndicator(
          {required BuildContext context,
          required VoidCallback onClick,
          required double width,
          required double height,
          required Color boxColor,
          required Color indicatorColor,
          required double indicOneHeight,
          required double indicTwoHeight,
          required double indicTwoPos,
          required String title,
          required Color color}) =>
      GestureDetector(
        onTap: () => onClick(),
        child: Stack(
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: Sizes().ratioWithScrWidth(context, width),
                height: Sizes().ratioWithScrWidth(context, height),
                color: boxColor,
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: txtStyle(
                      color: color, weight: FontWeight.w600, height: 1.4),
                  textAlign: TextAlign.center,
                )),
            Transform(
              transform: Matrix4.skewY(40 / 180 * pi),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                width: 3,
                height: Sizes().ratioWithScrWidth(context, indicOneHeight),
                color: indicatorColor,
              ),
            ),
            Positioned(
              top: Sizes().ratioWithScrWidth(context, indicTwoPos),
              child: Transform(
                transform: Matrix4.skewY(-40 / 180 * pi),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: 3,
                  height: Sizes().ratioWithScrWidth(context, indicTwoHeight),
                  color: indicatorColor,
                ),
              ),
            )
          ],
        ),
      );
}

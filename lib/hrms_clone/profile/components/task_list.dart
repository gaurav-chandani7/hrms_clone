import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils.dart';
import '../../project_detail_&_member/core/components.dart';
import '../../project_detail_&_member/data/member_list.dart';
import '../../project_detail_&_member/domain/select_indicator_cubit.dart';
import '../../project_detail_&_member/domain/select_timeline_cubit.dart';

typedef StringValueSetter = void Function(String value);

class TaskList extends StatefulWidget {
  final FocusNode textEditNode;
  final TextEditingController editingController;
  const TaskList(
      {super.key, required this.textEditNode, required this.editingController});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  ScrollController scrollController = ScrollController();

  int timelineIndex = 100;
  String? status;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final indicatorStatus = context.watch<SelectIndicatorCubit>().state;
    final timelinesState = context.watch<EditTimelineCubit>().state;
    final textBoxIndex = context.watch<TextBoxInplaceOfTextCubit>().state;
    final checkedTimelines = context.watch<SelectedTimelinesCubit>().state;
    const indAll = IndicatorSelect.all();
    const indPending = IndicatorSelect.pending();
    const indCompleted = IndicatorSelect.completed();
    return Column(children: [
      Components().detailCard(
          context: context,
          padWid: 0,
          padHeight: 0.01,
          alignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tabWithRedIndicator(
                      context: context,
                      onClick: () => context
                          .read<SelectIndicatorCubit>()
                          .toggleState(indAll),
                      width: 0.23,
                      height: 0.1,
                      boxColor: indicatorStatus == indAll
                          ? const Color.fromARGB(255, 219, 216, 216)
                          : Colors.white,
                      indicatorColor: indicatorStatus == indAll
                          ? const Color.fromARGB(255, 243, 34, 19)
                          : Colors.white,
                      indicOneHeight: 0.05,
                      indicTwoHeight: 0.08,
                      indicTwoPos: 0.02,
                      title: 'All Tasks',
                      color: indicatorStatus == indAll
                          ? Colors.black
                          : const Color.fromARGB(255, 124, 122, 122)),
                  tabWithRedIndicator(
                      context: context,
                      onClick: () => context
                          .read<SelectIndicatorCubit>()
                          .toggleState(indPending),
                      width: 0.23,
                      height: 0.14,
                      boxColor: indicatorStatus == indPending
                          ? const Color.fromARGB(255, 219, 216, 216)
                          : Colors.white,
                      indicatorColor: indicatorStatus == indPending
                          ? Colors.red
                          : Colors.white,
                      indicOneHeight: 0.05,
                      indicTwoHeight: 0.09,
                      indicTwoPos: 0.05,
                      title: 'Pending Tasks',
                      color: indicatorStatus == indPending
                          ? Colors.black
                          : const Color.fromARGB(255, 124, 122, 122)),
                  tabWithRedIndicator(
                      context: context,
                      onClick: () => context
                          .read<SelectIndicatorCubit>()
                          .toggleState(indCompleted),
                      width: 0.23,
                      height: 0.14,
                      boxColor: indicatorStatus == indCompleted
                          ? const Color.fromARGB(255, 219, 216, 216)
                          : Colors.white,
                      indicatorColor: indicatorStatus == indCompleted
                          ? Colors.red
                          : Colors.white,
                      indicOneHeight: 0.05,
                      indicTwoHeight: 0.09,
                      indicTwoPos: 0.05,
                      title: 'Completed Tasks',
                      color: indicatorStatus == indCompleted
                          ? Colors.black
                          : const Color.fromARGB(255, 124, 122, 122)),
                ])
          ]),
      Spacing().verticalSpace(context, 0.02),
      if (indicatorStatus == indAll)
        Components().detailCard(
            context: context,
            padWid: 0,
            padHeight: 0,
            alignment: CrossAxisAlignment.start,
            children: [
              ...timelinesState
                  .map(
                    (e) => Column(
                      children: [
                        Container(
                          color: checkedTimelines
                                  .contains(timelinesState.indexOf(e))
                              ? const Color.fromARGB(255, 233, 228, 228)
                              : Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    Sizes().ratioWithScrWidth(context, 0.03),
                                vertical:
                                    Sizes().ratioWithScrHeight(context, 0.01)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              color: checkedTimelines.contains(
                                                      timelinesState.indexOf(e))
                                                  ? Colors.green
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 138, 135, 135)),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (checkedTimelines.contains(
                                                  timelinesState.indexOf(e))) {
                                                context
                                                    .read<
                                                        SelectedTimelinesCubit>()
                                                    .deselectTimeline(
                                                        timelinesState
                                                            .indexOf(e));
                                              } else {
                                                context
                                                    .read<
                                                        SelectedTimelinesCubit>()
                                                    .addTimeLines(timelinesState
                                                        .indexOf(e));
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Icon(
                                                Icons.check,
                                                color: checkedTimelines
                                                        .contains(timelinesState
                                                            .indexOf(e))
                                                    ? Colors.white
                                                    : const Color.fromARGB(
                                                        255, 138, 135, 135),
                                                size: 18,
                                              ),
                                            ),
                                          )),
                                      Spacing().horizontalSpace(context, 0.03),
                                      GestureDetector(
                                        onTap: () {
                                          widget.textEditNode.requestFocus();
                                          setState(() {
                                            widget.editingController.text =
                                                e.toString();
                                            timelineIndex =
                                                timelinesState.indexOf(e);
                                          });

                                          context
                                              .read<TextBoxInplaceOfTextCubit>()
                                              .toggleState(
                                                  timelinesState.indexOf(e));
                                        },
                                        child: textBoxIndex != 100 &&
                                                textBoxIndex ==
                                                    timelinesState.indexOf(e)
                                            ? textBox()
                                            : timeLineItem(checkedTimelines,
                                                timelinesState, e),
                                      ),
                                    ],
                                  ),
                                  editIcons(timelinesState, e),
                                ]),
                          ),
                        ),
                        if (timelinesState.indexOf(e) !=
                            timelinesState.indexOf(timelinesState.last))
                          Container(
                            width: Sizes().scrWidth(context),
                            height: Sizes().ratioWithScrHeight(context, 0.004),
                            color: const Color.fromARGB(255, 218, 216, 216),
                          )
                      ],
                    ),
                  )
                  .toList(),
            ]),
      if (indicatorStatus != indAll) Spacing().verticalSpace(context, 0.6),
    ]);
  }

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
  Widget textBox() => SizedBox(
      width: Sizes().ratioWithScrWidth(context, 0.55),
      height: Sizes().ratioWithScrHeight(context, 0.04),
      child: TextField(
        focusNode: widget.textEditNode,
        maxLines: 2,
        controller: widget.editingController,
        style: txtStyle(size: 14),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                top: Sizes().ratioWithScrHeight(context, 0.012),
                left: Sizes().ratioWithScrHeight(context, 0.012),
                bottom: Sizes().ratioWithScrHeight(context, 0.012)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            )),
      ));
  Widget timeLineItem(
          List<int> checkedTimelines, List<String> timelinesState, String e) =>
      Container(
        width: Sizes().ratioWithScrWidth(context, 0.6),
        height: Sizes().ratioWithScrHeight(context, 0.06),
        alignment: Alignment.centerLeft,
        child: Text(
          e,
          style: txtStyle(
              color: checkedTimelines.contains(timelinesState.indexOf(e))
                  ? const Color.fromARGB(255, 138, 135, 135)
                  : Colors.black,
              height: 1.6),
        ),
      );
  Widget editIcons(List<String> timelinesState, String e) => Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 138, 135, 135)),
                  borderRadius: BorderRadius.circular(100)),
              child: const Padding(
                padding: EdgeInsets.all(3.0),
                child: Icon(
                  Icons.person_add,
                  color: Color.fromARGB(255, 138, 135, 135),
                  size: 17,
                ),
              )),
          Spacing().horizontalSpace(context, 0.02),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 138, 135, 135)),
                  borderRadius: BorderRadius.circular(100)),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    timelineIndex = timelinesState.indexOf(e);
                  });
                  context
                      .read<EditTimelineCubit>()
                      .removeTimeline(index: timelineIndex);
                },
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 138, 135, 135),
                    size: 17,
                  ),
                ),
              )),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../core/app_widgets.dart';
import '../../core/components/popup_menu/domain/show_menu_cubit.dart';
import '../../core/utils.dart';
import '../holidays/components/horiz_list_tile.dart';
import '../view_more_projects/components/entries_limit_widget.dart';

class EmployeeLeave extends StatefulWidget {
  const EmployeeLeave({super.key});

  @override
  State<EmployeeLeave> createState() => _EmployeeLeaveState();
}

class _EmployeeLeaveState extends State<EmployeeLeave> {
  ScrollController scrollController = ScrollController();
  String? leaveValue;
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final showMenuStatus = context.watch<ShowMenuCubit>().state;
    final headerStyle = txtStyle(weight: FontWeight.w600, height: 1.4);
    final listStyle = txtStyle(weight: FontWeight.w400, height: 1.4);
    return AppWidgets().appScaffold(
        context: context,
        showMenuStatus: showMenuStatus,
        controller: scrollController,
        onClick: () => context.read<ShowMenuCubit>().hideMenu(),
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Spacing().verticalSpace(context, 0.02),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Leaves',
                style: txtStyle(size: 18, weight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return SingleChildScrollView(
                              child: AlertDialog(
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 30,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Icon(Icons.cancel),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Add Leave',
                                          style: txtStyle(
                                              size: 22,
                                              weight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Spacing().verticalSpace(context, 0.02),
                                      Row(
                                        children: [
                                          Text(
                                            'Employee Leaving',
                                            style: txtStyle(
                                                weight: FontWeight.w400),
                                          ),
                                          Text(
                                            ' *',
                                            style: txtStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                      Spacing().verticalSpace(context, 0.02),
                                      Container(
                                        height: Sizes()
                                            .ratioWithScrHeight(context, 0.075),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            value:
                                                leaveValue ?? 'Select Employee',
                                            items: [
                                              'Select Employee',
                                              'George Merchason',
                                              'Mushe Abdul-Hakim',
                                              'Yahuza Abdul-Hakim'
                                            ]
                                                .map(
                                                  (e) => DropdownMenuItem(
                                                    value: e,
                                                    child: Text(
                                                      e,
                                                      style: txtStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                leaveValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      Spacing().verticalSpace(context, 0.015),
                                      Row(
                                        children: [
                                          Text(
                                            'From',
                                            style: txtStyle(
                                                weight: FontWeight.w400),
                                          ),
                                          Text(
                                            ' *',
                                            style: txtStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                      Spacing().verticalSpace(context, 0.015),
                                      GestureDetector(
                                        onTap: () async {
                                          DateTime? newDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2024));
                                          if (newDate != null) {
                                            setState(() {
                                              fromDateController.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(newDate);
                                            });
                                          }
                                        },
                                        child: TextField(
                                          enabled: false,
                                          controller: fromDateController,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              suffixIcon:
                                                  Icon(Icons.calendar_month)),
                                        ),
                                      ),
                                      Spacing().verticalSpace(context, 0.04),
                                      Row(
                                        children: [
                                          Text(
                                            'To',
                                            style: txtStyle(
                                                weight: FontWeight.w400),
                                          ),
                                          Text(
                                            ' *',
                                            style: txtStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                      Spacing().verticalSpace(context, 0.015),
                                      GestureDetector(
                                        onTap: () async {
                                          DateTime? newDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2024));
                                          if (newDate != null) {
                                            setState(() {
                                              toDateController.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(newDate);
                                            });
                                          }
                                        },
                                        child: TextField(
                                          enabled: false,
                                          controller: toDateController,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              suffixIcon:
                                                  Icon(Icons.calendar_month)),
                                        ),
                                      ),
                                      Spacing().verticalSpace(context, 0.04),
                                      Row(
                                        children: [
                                          Text(
                                            'Number of days',
                                            style: txtStyle(
                                                weight: FontWeight.w400),
                                          ),
                                          Text(
                                            ' *',
                                            style: txtStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                      Spacing().verticalSpace(context, 0.015),
                                      const TextField(
                                          decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      )),
                                      Spacing().verticalSpace(context, 0.02),
                                      Row(
                                        children: [
                                          Text(
                                            'Leave Reason',
                                            style: txtStyle(
                                                weight: FontWeight.w400),
                                          ),
                                          Text(
                                            ' *',
                                            style: txtStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                      Spacing().verticalSpace(context, 0.015),
                                      const TextField(
                                          maxLines: 3,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                          )),
                                      Spacing().verticalSpace(context, 0.02),
                                      SizedBox(
                                        width: Sizes()
                                            .ratioWithScrWidth(context, 0.3),
                                        height: Sizes()
                                            .ratioWithScrHeight(context, 0.06),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.orange),
                                                shape:
                                                    MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)))),
                                            onPressed: () {
                                              Navigator.pop(context);

                                              setState(() {});
                                            },
                                            child: const Text('Submit')),
                                      )
                                    ]),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: addButton(
                      context: context, title: 'Add Leaves', borderRad: 20))
            ]),
            Spacing().verticalSpace(context, 0.04),
            const EntriesLimitWidget(),
            Spacing().verticalSpace(context, 0.03),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Sizes().ratioWithScrHeight(context, 0.097),
                    alignment: Alignment.topCenter,
                    color: const Color.fromARGB(255, 209, 206, 206),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: Sizes().ratioWithScrHeight(context, 0.002)),
                      child: Container(
                        height: Sizes().ratioWithScrHeight(context, 0.09),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Sizes().ratioWithScrWidth(context, 0.04)),
                          child: Row(children: [
                            HorizListTile(
                                width: 0.25,
                                child: Text(
                                  'Employee',
                                  style: headerStyle,
                                )),
                            HorizListTile(
                              width: 0.11,
                              child: iconWrap(
                                  context,
                                  () {},
                                  [Icons.arrow_upward, Icons.arrow_downward],
                                  Alignment.bottomCenter,
                                  const Color.fromARGB(255, 139, 138, 138)),
                            ),
                            HorizListTile(
                                width: 0.12,
                                child: Text(
                                  'From',
                                  style: headerStyle,
                                )),
                            HorizListTile(
                              width: 0.11,
                              child: iconWrap(
                                  context,
                                  () {},
                                  [Icons.arrow_upward, Icons.arrow_downward],
                                  Alignment.bottomCenter,
                                  const Color.fromARGB(255, 139, 138, 138)),
                            ),
                            HorizListTile(
                                width: 0.075,
                                child: Text(
                                  'To',
                                  style: headerStyle,
                                )),
                            HorizListTile(
                              width: 0.11,
                              child: iconWrap(
                                  context,
                                  () {},
                                  [Icons.arrow_upward, Icons.arrow_downward],
                                  Alignment.bottomCenter,
                                  const Color.fromARGB(255, 139, 138, 138)),
                            ),
                            HorizListTile(
                                width: 0.12,
                                child: Text(
                                  'No\nof\nDays',
                                  style: headerStyle,
                                )),
                            HorizListTile(
                              width: 0.11,
                              child: iconWrap(
                                  context,
                                  () {},
                                  [Icons.arrow_upward, Icons.arrow_downward],
                                  Alignment.bottomCenter,
                                  const Color.fromARGB(255, 139, 138, 138)),
                            ),
                            HorizListTile(
                                width: 0.2,
                                child: Text(
                                  'Reason',
                                  style: headerStyle,
                                )),
                            HorizListTile(
                              width: 0.11,
                              child: iconWrap(
                                  context,
                                  () {},
                                  [Icons.arrow_upward, Icons.arrow_downward],
                                  Alignment.bottomCenter,
                                  const Color.fromARGB(255, 139, 138, 138)),
                            ),
                            HorizListTile(
                                width: 0.16,
                                child: Text(
                                  'Actions',
                                  style: headerStyle,
                                )),
                            HorizListTile(
                              width: 0.11,
                              child: iconWrap(
                                  context,
                                  () {},
                                  [Icons.arrow_upward, Icons.arrow_downward],
                                  Alignment.bottomCenter,
                                  const Color.fromARGB(255, 139, 138, 138)),
                            )
                          ]),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Spacing().verticalSpace(context, 0.025),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Sizes().ratioWithScrWidth(context, 0.04)),
                        child: Row(children: [
                          HorizListTile(
                              width: 0.37,
                              child: Text(
                                'George\nMerchason',
                                style: listStyle,
                              )),
                          HorizListTile(
                              width: 0.22,
                              child: Text(
                                '2020-\n09-01',
                                style: listStyle,
                              )),
                          HorizListTile(
                              width: 0.19,
                              child: Text(
                                '2020-\n10-01',
                                style: listStyle,
                              )),
                          HorizListTile(
                              width: 0.23,
                              child: Text(
                                '10',
                                style: listStyle,
                              )),
                          HorizListTile(
                              width: 0.29,
                              child: Text(
                                'This is a\ntest to leaving\nsystem',
                                style: listStyle,
                              )),
                          HorizListTile(
                              width: 0.26,
                              child: Container(
                                width: Sizes().ratioWithScrWidth(context, 0.28),
                                alignment: Alignment.centerRight,
                                child: PopupMenuButton(
                                  padding: EdgeInsets.zero,
                                  offset: Offset(
                                      1,
                                      Sizes()
                                          .ratioWithScrHeight(context, 0.06)),
                                  itemBuilder: (context) {
                                    return [
                                      ...[
                                        'Edit',
                                        'Delete',
                                      ].map((e) => PopupMenuItem(
                                            padding: EdgeInsets.only(
                                                top: Sizes().ratioWithScrWidth(
                                                    context, 0.02),
                                                left: Sizes().ratioWithScrWidth(
                                                    context, 0.05),
                                                bottom: Sizes()
                                                    .ratioWithScrWidth(
                                                        context, 0.02),
                                                right: Sizes()
                                                    .ratioWithScrWidth(
                                                        context, 0.1)),
                                            height: 0,
                                            child: Row(
                                              children: [
                                                e == 'Edit'
                                                    ? const Icon(
                                                        Icons.edit_outlined)
                                                    : const Icon(
                                                        Icons.delete_outline),
                                                Spacing().horizontalSpace(
                                                    context, 0.02),
                                                Text(
                                                  e,
                                                  style: txtStyle(
                                                      size: 13,
                                                      weight: FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ))
                                    ];
                                  },
                                ),
                              )),
                        ]),
                      ),
                      Spacing().verticalSpace(context, 0.025),
                      Container(
                        width: Sizes().ratioWithScrWidth(context, 1.62),
                        height: Sizes().ratioWithScrHeight(context, 0.002),
                        color: const Color.fromARGB(255, 199, 195, 195),
                      )
                    ],
                  ),
                  Spacing().verticalSpace(context, 0.03),
                  Row(
                    children: [
                      Spacing().horizontalSpace(context, 0.4),
                      Text(
                        'Showing 1 to 1 of 1 entries',
                        style: listStyle,
                      ),
                    ],
                  ),
                  Spacing().verticalSpace(context, 0.01),
                  Row(
                    children: [
                      Spacing().horizontalSpace(context, 0.6),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 187, 184, 184)),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6))),
                          child: Padding(
                            padding: EdgeInsets.all(
                                Sizes().ratioWithScrWidth(context, 0.02)),
                            child: Text(
                              'Previous',
                              style: txtStyle(weight: FontWeight.w300),
                            ),
                          )),
                      Container(
                          decoration: const BoxDecoration(
                              color: Colors.orange,
                              border: Border(
                                top: BorderSide(
                                    color: Color.fromARGB(255, 187, 184, 184)),
                                bottom: BorderSide(
                                    color: Color.fromARGB(255, 187, 184, 184)),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(
                                Sizes().ratioWithScrWidth(context, 0.02)),
                            child: Text(
                              '1',
                              style: txtStyle(color: Colors.white),
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 187, 184, 184),
                              ),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6))),
                          child: Padding(
                            padding: EdgeInsets.all(
                                Sizes().ratioWithScrWidth(context, 0.02)),
                            child: Text(
                              'Next',
                              style: txtStyle(weight: FontWeight.w300),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )
          ])
        ]);
  }

  Widget addButton(
          {required BuildContext context,
          required String title,
          required double borderRad}) =>
      Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 153, 69),
            borderRadius: BorderRadius.circular(borderRad)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            const Icon(
              Icons.add,
              size: 16,
              color: Colors.white,
            ),
            Spacing().horizontalSpace(context, 0.005),
            Text(
              title,
              style: txtStyle(color: Colors.white, size: 16),
            ),
          ]),
        ),
      );

  Widget iconWrap(BuildContext context, VoidCallback onClick,
          List<IconData> icon, Alignment alignment, Color? iconColor) =>
      Container(
          width: Sizes().ratioWithScrWidth(context, 0.11),
          height: Sizes().ratioWithScrHeight(context, 0.02),
          alignment: alignment,
          child: SizedBox(
            height: 20,
            child: GestureDetector(
              onTap: () => onClick(),
              child: Stack(
                children: [
                  Positioned(
                    right: 28,
                    child: Icon(
                      icon[0],
                      color: iconColor,
                      size: 16,
                    ),
                  ),
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Icon(
                      icon[1],
                      size: 16,
                      color: const Color.fromARGB(255, 139, 138, 138),
                    ),
                  ),
                ],
              ),
            ),
          ));
}

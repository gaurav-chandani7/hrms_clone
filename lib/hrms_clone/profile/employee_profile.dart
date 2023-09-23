import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_clone/hrms_clone/profile/components/bank_and_statutory.dart';
import 'package:hrms_clone/hrms_clone/profile/components/personal_information.dart';
import 'package:hrms_clone/hrms_clone/view_more_projects/components/member_detail_vert_list.dart';
import '../../core/app_widgets.dart';
import '../../core/components/popup_menu/domain/show_menu_cubit.dart';
import '../../core/utils.dart';
import '../project_detail_&_member/core/components.dart';

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({super.key});

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  ScrollController scrollController = ScrollController();

  String? status;
  String? salary;
  String? paymentType;
  String? pfContribution;
  String? pfNo;
  String? employeePfRate;
  String? additionalPfRate;
  String? esiContribution;
  String? esiNo;
  String? employeeEsiRate;
  String? additionalEsiRate;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final showMenuStatus = context.watch<ShowMenuCubit>().state;
    return AppWidgets().appScaffold(
        context: context,
        showMenuStatus: showMenuStatus,
        controller: scrollController,
        onClick: () => context.read<ShowMenuCubit>().hideMenu(),
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
                  'John Doe',
                  style: txtStyle(size: 22, weight: FontWeight.w600),
                ),
                Spacing().verticalSpace(context, 0.01),
                Text(
                  'UI/UX Design Team',
                  style: txtStyle(size: 13, weight: FontWeight.w300),
                ),
                Spacing().verticalSpace(context, 0.02),
                Text(
                  'Web Designer',
                  style: txtStyle(size: 13, weight: FontWeight.w300),
                ),
                Spacing().verticalSpace(context, 0.02),
                Text(
                  'Employee ID: FT-0001',
                  style: txtStyle(size: 15, weight: FontWeight.w500),
                ),
                Spacing().verticalSpace(context, 0.01),
                Text(
                  'Date of Join: 1st Jan 2013',
                  style: txtStyle(size: 12, weight: FontWeight.w300),
                ),
                Spacing().verticalSpace(context, 0.035),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink)),
                    onPressed: () {},
                    child: const Text('Send Message')),
                Spacing().verticalSpace(context, 0.018),
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
                bioItem(field: 'Gender', child: const Text('Male')),
                bioItem(
                    field: 'Reports\nto',
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/member_list/downloadTwo.jpg'),
                          radius: 16,
                        ),
                        Spacing().horizontalSpace(context, 0.02),
                        Text(
                          'Jeffery Lalor',
                          style: txtStyle(color: Colors.blue),
                        ),
                      ],
                    )),
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
                        title: 'Profile',
                        boxColor: index == 0
                            ? const Color.fromARGB(255, 214, 211, 211)
                            : Colors.white,
                        indColor: index == 0 ? Colors.orange : Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      index = 1;
                    }),
                    child: optionItem(
                        title: 'Projects',
                        boxColor: index == 1
                            ? const Color.fromARGB(255, 214, 211, 211)
                            : Colors.white,
                        indColor: index == 1 ? Colors.orange : Colors.white),
                  )
                ]),
                Row(children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      index = 2;
                    }),
                    child: optionItem(
                        title: 'Bank & Statutory (Admin Only)',
                        boxColor: index == 2
                            ? const Color.fromARGB(255, 214, 211, 211)
                            : Colors.white,
                        indColor: index == 2 ? Colors.orange : Colors.white),
                  ),
                ]),
              ]),
          AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              child: (() {
                if (index == 0) {
                  return const PersonalInformation();
                } else if (index == 1) {
                  return const MemberDetailVertList();
                } else {
                  return const BankAndStatutory();
                }
              }()))
        ]);
  }

  Widget bioItem({required String field, required Widget child}) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: Sizes().ratioWithScrHeight(context, 0.01),
            horizontal: Sizes().ratioWithScrWidth(context, 0.02)),
        child: Row(children: [
          SizedBox(
              width: Sizes().ratioWithScrWidth(context, 0.28),
              child: Text('$field:')),
          SizedBox(
              width: Sizes().ratioWithScrWidth(context, 0.48), child: child),
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
}

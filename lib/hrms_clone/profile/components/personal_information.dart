import 'dart:math';
import 'package:flutter/material.dart';
import '../../../core/utils.dart';
import '../../holidays/components/horiz_list_tile.dart';
import '../../project_detail_&_member/core/components.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Components().detailCard(
          context: context,
          padWid: 0.05,
          padHeight: 0.04,
          alignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Personal Informations',
                style: txtStyle(size: 20, weight: FontWeight.w600),
              ),
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 207, 205, 205),
                radius: 16,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
              ),
            ]),
            Spacing().verticalSpace(context, 0.015),
            personalInfItem(
                field: 'Passport No.', child: const Text('9876543210')),
            personalInfItem(
                field: 'Passport Exp Date.', child: const Text('9876543210')),
            personalInfItem(
                field: 'Tel',
                child: Text(
                  '9876543210',
                  style: txtStyle(color: Colors.blue),
                )),
            personalInfItem(field: 'Nationality', child: const Text('Indian')),
            personalInfItem(field: 'Religion', child: const Text('Hindu')),
            personalInfItem(
                field: 'Marital status', child: const Text('Married')),
            personalInfItem(
                field: 'Employment of\nspouce', child: const Text('No')),
            personalInfItem(field: 'No. of children', child: const Text('2')),
          ]),
      Components().detailCard(
          context: context,
          padWid: 0.05,
          padHeight: 0.04,
          alignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Emergency Contact',
                style: txtStyle(size: 20, weight: FontWeight.w600),
              ),
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 207, 205, 205),
                radius: 16,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
              ),
            ]),
            Spacing().verticalSpace(context, 0.015),
            personalInfItem(field: 'Primary', child: const Text('')),
            personalInfItem(field: 'Name', child: const Text('John Doe')),
            personalInfItem(field: 'Relationship', child: const Text('Father')),
            personalInfItem(
                field: 'Phone', child: const Text('9876543210,\n9876543210')),
            personalInfItem(field: 'Secondary', child: const Text('')),
            personalInfItem(field: 'Name', child: const Text('Karen Wills')),
            personalInfItem(
                field: 'Relationship', child: const Text('Brother')),
            personalInfItem(
                field: 'Phone', child: const Text('9876543210,\n9876543210')),
          ]),
      Components().detailCard(
          context: context,
          padWid: 0.05,
          padHeight: 0.04,
          alignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Bank information',
                style: txtStyle(size: 20, weight: FontWeight.w600),
              ),
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 207, 205, 205),
                radius: 16,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
              ),
            ]),
            personalInfItem(
                field: 'Bank Name', child: const Text('ICICI Bank')),
            personalInfItem(
                field: 'Bank account No.', child: const Text('159843014641')),
            personalInfItem(field: 'IFSC Code', child: const Text('ICI24504')),
            personalInfItem(field: 'PAN No', child: const Text('TC000Y56')),
          ]),
      Components().detailCard(
          context: context,
          padWid: 0.05,
          padHeight: 0.04,
          alignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Family Informations',
                style: txtStyle(size: 20, weight: FontWeight.w600),
              ),
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 207, 205, 205),
                radius: 16,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
              ),
            ]),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(children: const [
                    HorizListTile(width: 0.2, child: Text('Name')),
                    HorizListTile(width: 0.3, child: Text('Relationship')),
                    HorizListTile(width: 0.3, child: Text('Date of Birth')),
                    HorizListTile(width: 0.3, child: Text('Phone')),
                  ]),
                  Row(children: const [
                    HorizListTile(width: 0.2, child: Text('Leo')),
                    HorizListTile(width: 0.3, child: Text('Brother')),
                    HorizListTile(width: 0.3, child: Text('Feb 16th, 2019')),
                    HorizListTile(width: 0.3, child: Text('9876543210')),
                  ]),
                ],
              ),
            )
          ]),
      Components().detailCard(
          context: context,
          padWid: 0.05,
          padHeight: 0.04,
          alignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Education Informations',
                style: txtStyle(size: 20, weight: FontWeight.w600),
              ),
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 207, 205, 205),
                radius: 16,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
              ),
            ]),
            bioItemWithLineInd(color: Colors.white),
            bioItemWithLineInd(color: Colors.black),
          ]),
      Components().detailCard(
          context: context,
          padWid: 0.05,
          padHeight: 0.04,
          alignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Experience',
                style: txtStyle(size: 20, weight: FontWeight.w600),
              ),
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 207, 205, 205),
                radius: 16,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Color.fromARGB(255, 120, 120, 120),
                ),
              ),
            ]),
            experienceItemWithLineInd(
                color: Colors.white,
                title: 'Web Designer at Zen Corporation',
                duration: 'Jan 2013-Present (5 years 2 months)'),
            experienceItemWithLineInd(
                color: Colors.black,
                title: 'Web Designer at Ron-tech',
                duration: 'Jan 2013-Present (5 years 2 months)'),
            experienceItemWithLineInd(
                color: Colors.black,
                title: 'Web Designer at Dalt Technology',
                duration: 'Jan 2013-Present (5 years 2 months)'),
          ])
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
  Widget personalInfItem({required String field, required Widget child}) =>
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: Sizes().ratioWithScrHeight(context, 0.01),
            horizontal: Sizes().ratioWithScrWidth(context, 0.002)),
        child: Row(children: [
          SizedBox(
              width: Sizes().ratioWithScrWidth(context, 0.45),
              child: Text('$field:')),
          SizedBox(
              width: Sizes().ratioWithScrWidth(context, 0.3), child: child),
        ]),
      );
  Widget bioItemWithLineInd({required Color color}) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(children: [
          Container(
            width: 4,
            height: Sizes().ratioWithScrHeight(context, 0.02),
            color: color,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(100)),
          ),
          Container(
            width: 4,
            height: Sizes().ratioWithScrHeight(context, 0.1),
            color: Colors.black,
          ),
        ]),
        Spacing().horizontalSpace(context, 0.06),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Spacing().verticalSpace(context, 0.02),
          const Text('Internation College of Arts and\nScience (UG)'),
          const Text('Bsc Computer Science'),
          const Text('2000-2003'),
        ])
      ]);
  Widget experienceItemWithLineInd(
          {required Color color,
          required String title,
          required String duration}) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(children: [
          Container(
            width: 4,
            height: Sizes().ratioWithScrHeight(context, 0.02),
            color: color,
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(100)),
          ),
          Container(
            width: 4,
            height: Sizes().ratioWithScrHeight(context, 0.06),
            color: Colors.black,
          ),
        ]),
        Spacing().horizontalSpace(context, 0.06),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Spacing().verticalSpace(context, 0.02),
          Text(title),
          Text(duration),
        ])
      ]);
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

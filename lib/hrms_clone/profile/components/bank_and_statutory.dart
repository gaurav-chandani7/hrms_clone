import 'package:flutter/material.dart';
import '../../../core/utils.dart';
import '../../project_detail_&_member/core/components.dart';

class BankAndStatutory extends StatefulWidget {
  const BankAndStatutory({super.key});

  @override
  State<BankAndStatutory> createState() => _BankAndStatutoryState();
}

class _BankAndStatutoryState extends State<BankAndStatutory> {
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
    return Components().detailCard(
        context: context,
        padWid: 0.05,
        padHeight: 0.04,
        alignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            Text(
              'Basic Salary Information',
              style: txtStyle(size: 20, weight: FontWeight.w600),
            )
          ]),
          Spacing().verticalSpace(context, 0.02),
          Row(children: [
            const Text('Salary basis '),
            Text(
              '*',
              style: txtStyle(color: Colors.red),
            )
          ]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: salary ?? 'Select salary basis type',
                items: [
                  'Select salary basis type',
                  'Hourly',
                  'Daily',
                  'Weekly',
                  'Monthly'
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == salary ? Colors.red : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    salary = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [Text('Salary Amount'), Text('per month')]),
          Spacing().verticalSpace(context, 0.015),
          Container(
              width: Sizes().scrWidth(context),
              height: Sizes().ratioWithScrHeight(context, 0.05),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromARGB(255, 173, 167, 167)),
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: Row(
                children: [
                  Container(
                      width: Sizes().ratioWithScrWidth(context, 0.1),
                      height: Sizes().ratioWithScrHeight(context, 0.05),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 219, 216, 216),
                          border: Border.all(
                              color: const Color.fromARGB(255, 173, 167, 167)),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6))),
                      child: const Text('\$')),
                  SizedBox(
                      width: Sizes().ratioWithScrWidth(context, 0.7),
                      child: const TextField()),
                ],
              )),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [
            Text('Payment type'),
          ]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: paymentType ?? 'Select payment type',
                items: [
                  'Select payment type',
                  'Bank transfer',
                  'Check',
                  'Cash',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color:
                                  e == paymentType ? Colors.red : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    paymentType = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: [
            Text(
              'PF Information',
              style: txtStyle(size: 20, weight: FontWeight.w600),
            )
          ]),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [
            Text('PF contribution'),
          ]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: pfContribution ?? 'Select PF contribution',
                items: [
                  'Select PF contribution',
                  'Yes',
                  'No',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == pfContribution
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    pfContribution = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [Text('PF No.'), Text('*')]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: pfNo ?? 'Select PF contribution',
                items: [
                  'Select PF contribution',
                  'Yes',
                  'No',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == pfNo ? Colors.red : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    pfNo = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [
            Text('Employee PF rate'),
          ]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: employeePfRate ?? 'Select PF contribution',
                items: [
                  'Select PF contribution',
                  'Yes',
                  'No',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == employeePfRate
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    employeePfRate = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [Text('Additional rate'), Text('*')]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: additionalPfRate ?? 'Select additional rate',
                items: ['Select additional rate', '0%', '1%', '2%', '3%', '4%']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == additionalPfRate
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    additionalPfRate = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: [
            Text(
              'ESI Information',
              style: txtStyle(size: 20, weight: FontWeight.w600),
            )
          ]),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [
            Text('ESI contribution'),
          ]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: esiContribution ?? 'Select ESI contribution',
                items: [
                  'Select ESI contribution',
                  'Yes',
                  'No',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == esiContribution
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    esiContribution = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [Text('ESI No.'), Text('*')]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: esiNo ?? 'Select ESI contribution',
                items: [
                  'Select ESI contribution',
                  'Yes',
                  'No',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == esiNo ? Colors.red : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    esiNo = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [
            Text('Employee ESI rate'),
          ]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: employeeEsiRate ?? 'Select ESI contribution',
                items: [
                  'Select ESI contribution',
                  'Yes',
                  'No',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == employeeEsiRate
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    employeeEsiRate = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [Text('Additional rate'), Text('*')]),
          Spacing().verticalSpace(context, 0.015),
          Container(
            height: Sizes().ratioWithScrHeight(context, 0.075),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromARGB(255, 173, 167, 167)),
                borderRadius: BorderRadius.circular(2)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: additionalEsiRate ?? 'Select additional rate',
                items: [
                  'Select additional rate',
                  'Yes',
                  'No',
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: txtStyle(
                              color: e == additionalEsiRate
                                  ? Colors.red
                                  : Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    additionalEsiRate = value;
                  });
                },
              ),
            ),
          ),
          Spacing().verticalSpace(context, 0.02),
          Row(children: const [
            Text('Total rate'),
          ]),
          TextField(
            controller: TextEditingController(text: '11%'),
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
        ]);
  }
}

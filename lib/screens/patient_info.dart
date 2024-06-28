import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:midterm_mobile_3/consts/styles.dart';
import 'package:midterm_mobile_3/controllers/auth_controller.dart';
import 'package:midterm_mobile_3/screens/login.dart';

class PatientInfoPage extends StatefulWidget {
  static const String route = '/patientInfo';
  static const String name = 'Patient Info';
  const PatientInfoPage({super.key});

  @override
  State<PatientInfoPage> createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: Center(
            child: Column(
              children: [
                name(),
                const SizedBox(height: 20),
                details(),
                doctors(),
                const SizedBox(height: 20),
                vitals(),
                meds(),
                operations(),
                const SizedBox(height: 5),
                historyOperation(),
                const SizedBox(height: 5),
                history(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget name() {
    return SizedBox(
      height: 150,
      width: 390,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/samplePatient.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Daniel Caesar',
                  style: interBold.copyWith(color: orange, fontSize: 24)),
              const SizedBox(height: 5),
              Text('June 26, 2024',
                  style: interRegular.copyWith(color: orange, fontSize: 16)),
              Text('Date Admitted',
                  style: interItalic.copyWith(color: orange, fontSize: 13)),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              AuthController.instance.logout();
              context.go(Login.route);
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.logout,
                color: Color(0xFFFE8570),
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget details() {
    return SizedBox(
      width: 390,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          age(),
          weight(),
          bloodType(),
          room(),
        ],
      ),
    );
  }

  Column age() {
    return Column(
      children: [
        detailHead('Age'),
        detailData('68'),
      ],
    );
  }

  Column weight() {
    return Column(
      children: [
        detailHead('Weight'),
        detailData('58 Kg'),
      ],
    );
  }

  Column bloodType() {
    return Column(
      children: [
        detailHead('Blood Type'),
        detailData('O+'),
      ],
    );
  }

  Column room() {
    return Column(
      children: [
        detailHead('Room no.'),
        detailData('301'),
      ],
    );
  }

  Widget detailData(String content) {
    return Text(content,
        style: interBold.copyWith(fontSize: 24, color: Colors.black));
  }

  Widget detailHead(String content) {
    return Text(content,
        style: interBold.copyWith(fontSize: 16, color: orange));
  }

  Widget doctors() {
    // NEED TO IMPLEMENT MODEL FOR DOCTORS IF HAVE TIME
    return SizedBox(
      height: 216,
      width: 390,
      child: Column(
        children: [
          header('assets/icons/heart_icon.png', 'Doctors Assigned'),
          const SizedBox(height: 10),
          Container(
            width: 390,
            height: 172,
            decoration: BoxDecoration(
              color: const Color(0xFFFBEDE8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: RawScrollbar(
                thumbVisibility: true,
                thumbColor: const Color(0xFFFE8570),
                radius: const Radius.circular(20),
                controller: _scrollController,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  controller: _scrollController,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 343,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 65,
                            width: 72,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFE8570),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dr. Jane Doe',
                                style: interBold.copyWith(
                                    fontSize: 14, color: black),
                              ),
                              Text(
                                'Nephrologist',
                                style: interItalic.copyWith(
                                    fontSize: 12, color: black),
                              )
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              'assets/icons/dots_icon.png',
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row header(icon, title) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 31,
          height: 31,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: interBold.copyWith(fontSize: 20, color: orange),
        ),
      ],
    );
  }

  Widget vitals() {
    return SizedBox(
      height: 150,
      width: 390,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/heart_icon.png',
                width: 31,
                height: 31,
              ),
              const SizedBox(width: 8),
              Text(
                'Vital Statistics',
                style: interBold.copyWith(fontSize: 20, color: orange),
              ),
              const Spacer(),
              Text(
                'Last updated: 2:00 PM',
                style: interRegular.copyWith(fontSize: 11, color: orange),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: 390,
            height: 92,
            decoration: BoxDecoration(
              color: const Color(0xFFFBEDE8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        statistic('Blood Pressure', '140/90'),
                        const SizedBox(width: 10),
                        statistic('Heart Rate', '95'),
                        const SizedBox(width: 10),
                        statistic('Glucose Level', '89.72'),
                        const SizedBox(width: 10),
                        statistic('Temperature', '28.03'),
                        const SizedBox(width: 10),
                        statistic('Oxygen Level', '28.03'),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset(
                        'assets/icons/dots_icon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget statistic(statistic, number) {
    return Container(
      height: 60,
      width: 113,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              top: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statistic,
                  style: interItalicBold.copyWith(
                    color: orange,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  number,
                  textAlign: TextAlign.start,
                  style: interBold.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget meds() {
    // CHANGE TO LIST VIEW
    return SizedBox(
      width: 390,
      height: 202,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: header('assets/icons/med_icon.png', 'Medicines Taken'),
          ),
          const SizedBox(height: 5),
          medicine('Paracetamol', 'Thrice a day', 'March 17, 2024'),
          const SizedBox(height: 5),
          medicine('Paracetamol', 'Thrice a day', 'March 17, 2024'),
        ],
      ),
    );
  }

  Widget medicine(medName, instruction, date) {
    return Container(
      width: 390,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFE8570)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medName,
              style: interBold.copyWith(fontSize: 14, color: black),
            ),
            Text('Instructions: $instruction',
                style: interItalic.copyWith(fontSize: 12)),
            Text('Date medication began: $date',
                style: interItalic.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget operations() {
    return SizedBox(
      height: 140,
      width: 390,
      child: Column(
        children: [
          header('assets/icons/glove_icon.png', 'Upcoming Operation'),
          const SizedBox(height: 5),
          operation('Dialysis', 'July 13, 2024', 'Dr. Jane Doe', 'Dr. Jane Doe')
        ],
      ),
    );
  }

  Widget operation(name, schedule, administer, suggested) {
    return Container(
      width: 390,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFE8570)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: interBold.copyWith(fontSize: 14, color: black),
            ),
            Text('Date of operation: $schedule',
                style: interItalic.copyWith(fontSize: 12)),
            Text('To be administered by: $administer',
                style: interItalic.copyWith(fontSize: 12)),
            Text('Suggested by: $schedule',
                style: interItalic.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget historyOperation() {
    return Container(
      height: 41,
      width: 390,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/sheet_icon.png',
                width: 31,
                height: 31,
              ),
              const SizedBox(width: 8),
              Text(
                'Operation History',
                style: interBold.copyWith(fontSize: 20, color: orange),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget history() {
    return Container(
      width: 390,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: DataTable(
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => lightOrange),
              border: TableBorder(
                horizontalInside: BorderSide(color: orange),
                top: BorderSide(color: orange),
                bottom: BorderSide(color: orange),
              ),
              columns: <DataColumn>[
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Type',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Surgeon',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Remarks',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text('5/26/2024')),
                  DataCell(Text('2:00 PM')),
                  DataCell(Text('Endoscopy')),
                  DataCell(Text('Clumps were found in the esophagus')),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text('5/26/2024')),
                  DataCell(Text('04:30 PM')),
                  DataCell(Text('Colonoscopy')),
                  DataCell(Text('No Debris were found in the colon')),
                ]),
              ],
            ),
          )),
    );
  }
}

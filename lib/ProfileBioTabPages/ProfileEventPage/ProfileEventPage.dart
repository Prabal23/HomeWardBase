import 'package:flutter/material.dart';
import 'package:homewardbase/EventDetailsPage/EventDetailsPage.dart';
import 'package:intl/intl.dart';

class ProfileEventPage extends StatefulWidget {
  @override
  _ProfileEventPageState createState() => _ProfileEventPageState();
}

class _ProfileEventPageState extends State<ProfileEventPage> {
  List monYearList = [];
  List dayList = [];
  List dayList1 = [];
  List allList = [];
  List finalList = [];
  List newList = [];
  List eventList = [
    // {
    //   'id': '8',
    //   'month': 'August 2020',
    //   'day': '02',
    //   'year': '2020',
    //   'weekDay': 'Sun',
    //   'details': "Appointment for Doctor's consultation",
    //   'stTime': '08:00 AM',
    //   'endTime': '11:00 AM',
    //   'pic': 'assets/image/pin.png',
    // },
    // {
    //   'id': '9',
    //   'month': 'August 2020',
    //   'day': '02',
    //   'year': '2020',
    //   'weekDay': 'Sun',
    //   'details': "Appointment for Doctor's consultation",
    //   'stTime': '08:00 AM',
    //   'endTime': '11:00 AM',
    //   'pic': 'assets/image/pin.png',
    // },
    {
      'id': '1',
      'month': 'July 2020',
      'day': '29',
      'year': '2020',
      'weekDay': 'Wed',
      'details': "Appointment for Doctor's consultation",
      'stTime': '08:00 AM',
      'endTime': '11:00 AM',
      'pic': 'assets/image/pin.png',
    },
    {
      'id': '2',
      'month': 'July 2020',
      'day': '25',
      'year': '2020',
      'weekDay': 'Thu',
      'details': 'Doctor Appointment',
      'stTime': '01:30 PM',
      'endTime': '02:00 PM',
      'pic': 'assets/image/stethoscope.png',
    },
    {
      'id': '3',
      'month': 'July 2020',
      'day': '25',
      'year': '2020',
      'weekDay': 'Thu',
      'details': 'Doctor Appointment',
      'stTime': '08:00 AM',
      'endTime': '11:00 AM',
      'pic': 'assets/image/teeth.png',
    },
    {
      'id': '4',
      'month': 'June 2020',
      'day': '28',
      'year': '2020',
      'weekDay': 'Sun',
      'details': 'Casa home visit',
      'stTime': '08:00 AM',
      'endTime': '11:00 AM',
      'pic': 'assets/image/pin.png',
    },
    {
      'id': '5',
      'month': 'June 2020',
      'day': '28',
      'year': '2020',
      'weekDay': 'Sun',
      'details': 'Doctor Appointment',
      'stTime': '01:30 PM',
      'endTime': '02:00 PM',
      'pic': 'assets/image/stethoscope.png',
    },
    {
      'id': '6',
      'month': 'June 2020',
      'day': '28',
      'year': '2020',
      'weekDay': 'Sun',
      'details': 'Doctor Appointment',
      'stTime': '08:00 AM',
      'endTime': '11:00 AM',
      'pic': 'assets/image/teeth.png',
    },
    {
      'id': '7',
      'month': 'June 2020',
      'day': '25',
      'year': '2020',
      'weekDay': 'Thu',
      'details': 'Casa home visit',
      'stTime': '08:00 AM',
      'endTime': '11:00 AM',
      'pic': 'assets/image/pin.png',
    },
  ];

  String today = "";
  String currentDate = "";
  String currentMonth = "";
  String currentYear = "";
  String currentWeekDay = "";
  String lastID = "";

  @override
  initState() {
    super.initState();

    setState(() {
      DateTime dateTimeNow = DateTime.now();

      currentDate = DateFormat.d().format(dateTimeNow);
      currentMonth = DateFormat.MMMM().format(dateTimeNow);
      currentYear = DateFormat.y().format(dateTimeNow);
      currentWeekDay = DateFormat.E().format(dateTimeNow);

      today = currentMonth + " " + currentYear;

      // print(currentDate);
      // print(currentMonth);
      // print(currentYear);
      // print(currentWeekDay);
      // print(today);

      int isCurrentAvailable = 0;

      for (int i = 0; i < eventList.length; i++) {
        if (currentDate.length == 1) {
          currentDate = "0" + currentDate;
        }
        print("currentDate + " " + currentMonth + " " + currentYear");
        print(currentDate + " " + currentMonth + " " + currentYear);
        print("eventList[i]['day'] + " " + eventList[i]['month']");
        print(eventList[i]['day'] + " " + eventList[i]['month']);
        if (currentDate + " " + currentMonth + " " + currentYear !=
            eventList[i]['day'] + " " + eventList[i]['month']) {
          isCurrentAvailable = 1;
          print("isCurrentAvailable");
          print(isCurrentAvailable);
        }
        lastID = eventList[i]['id'];
      }

      List tempList = [];
      int lID = int.parse(lastID);

      if (isCurrentAvailable == 1) {
        tempList = eventList;
        eventList = [];
        eventList.add(
          {
            'id': '${lID + 1}',
            'month': '$currentMonth $currentYear',
            'day': '$currentDate',
            'year': '$currentYear',
            'weekDay': '$currentWeekDay',
            'details': '',
            'stTime': '',
            'endTime': '',
            'pic': '',
          },
        );
        for (int i = 0; i < tempList.length; i++) {
          eventList.add(
            {
              'id': '${tempList[i]['id']}',
              'month': '${tempList[i]['month']}',
              'day': '${tempList[i]['day']}',
              'year': '${tempList[i]['year']}',
              'weekDay': '${tempList[i]['weekDay']}',
              'details': '${tempList[i]['details']}',
              'stTime': '${tempList[i]['stTime']}',
              'endTime': '${tempList[i]['endTime']}',
              'pic': '${tempList[i]['pic']}',
            },
          );
        }
      }
    });

    for (int i = 0; i < eventList.length; i++) {
      if (!monYearList.contains("${eventList[i]['month']}")) {
        monYearList.add("${eventList[i]['month']}");
      }
    }

    List day = [];

    for (int i = 0; i < monYearList.length; i++) {
      dayList = [];
      day = [];
      for (int j = 0; j < eventList.length; j++) {
        String monDate = "${eventList[j]['month']}";
        if (monYearList[i] == monDate) {
          if (!day.contains(eventList[j]['day'])) {
            day.add(eventList[j]['day']);
            dayList.add({
              'day': eventList[j]['day'],
              'weekDay': eventList[j]['weekDay'],
              'details': eventList[j]['details'],
            });
          }
        }
      }

      allList.add({'dayWeek': monYearList[i], 'list': dayList});
    }

    for (int x = 0; x < allList.length; x++) {
      for (int i = 0; i < allList[x]['list'].length; i++) {
        dayList1 = [];
        for (int j = 0; j < eventList.length; j++) {
          if (allList[x]['list'][i]['day'] == eventList[j]['day'] &&
              allList[x]['dayWeek'] == eventList[j]['month']) {
            dayList1.add(
              {
                'id': eventList[j]['id'],
                'month': eventList[j]['month'],
                'day': eventList[j]['day'],
                'year': eventList[j]['year'],
                'weekDay': eventList[j]['weekDay'],
                'details': eventList[j]['details'],
                'stTime': eventList[j]['stTime'],
                'endTime': eventList[j]['endTime'],
                'pic': eventList[j]['pic'],
              },
            );
          }
        }

        finalList.add({
          'dayWeek': allList[x]['dayWeek'],
          'day1': allList[x]['list'][i]['day'],
          'weekDay': allList[x]['list'][i]['weekDay'],
          'details': allList[x]['list'][i]['details'],
          'list1': dayList1
        });
      }
    }

    List checkingList = [];

    for (int i = 0; i < monYearList.length; i++) {
      checkingList = [];
      for (int j = 0; j < finalList.length; j++) {
        if (monYearList[i] == finalList[j]['dayWeek']) {
          checkingList.add({
            'dayWeek': finalList[j]['dayWeek'],
            'day1': finalList[j]['day1'],
            'weekDay': finalList[j]['weekDay'],
            'details': finalList[j]['details'],
            'list1': finalList[j]['list1']
          });
        }
      }
      newList.add({'monthDate': monYearList[i], 'info': checkingList});
    }

    // print("allList");
    // print(allList);

    // print("finalList");
    // print(finalList);

    print("newList");
    print(newList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: List.generate(newList.length, (index) {
            return Container(
              margin:
                  EdgeInsets.only(bottom: newList.length - 1 == index ? 70 : 0),
              child: Column(
                children: <Widget>[
                  newList[index]['monthDate'] == today
                      ? Container(
                          padding: EdgeInsets.only(top: 20),
                        )
                      : Container(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  newList[index]['monthDate'],
                                  style: TextStyle(
                                      color: Color(0xff171725),
                                      fontSize: 15,
                                      fontFamily: 'quicksand',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  //height: 15,
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, top: 5),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 2,
                                    thickness: 0.15,
                                    //indent: 20,
                                    endIndent: 0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  Column(
                      children:
                          List.generate(newList[index]['info'].length, (ind1) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment:
                            newList[index]['info'][ind1]['list1'].length == 1 &&
                                    newList[index]['info'][ind1]['list1'][0]
                                            ['details'] ==
                                        ""
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                        children: <Widget>[
                          newList[index]['monthDate'] == today &&
                                  newList[index]['info'][ind1]['day1'] ==
                                      currentDate &&
                                  newList[index]['info'][ind1]['weekDay'] ==
                                      currentWeekDay
                              ? Container(
                                  margin: EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "Today",
                                    style: TextStyle(
                                        color: Color(0xff272755),
                                        fontSize: 10,
                                        fontFamily: 'quicksand',
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              : Column(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        newList[index]['info'][ind1]['weekDay'],
                                        style: TextStyle(
                                            color: Color(0xff272755),
                                            fontSize: 10,
                                            fontFamily: 'quicksand',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        newList[index]['info'][ind1]['day1'],
                                        style: TextStyle(
                                            color: Color(0xff272755),
                                            fontSize: 19,
                                            fontFamily: 'quicksand',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                          newList[index]['info'][ind1]['list1'].length == 1 &&
                                  newList[index]['info'][ind1]['list1'][0]
                                          ['details'] ==
                                      ""
                              ? Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  padding: EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15, right: 15),
                                  margin: EdgeInsets.only(
                                      left: newList[index]['monthDate'] ==
                                                  today &&
                                              newList[index]['info'][ind1]
                                                      ['day1'] ==
                                                  currentDate &&
                                              newList[index]['info'][ind1]
                                                      ['weekDay'] ==
                                                  currentWeekDay
                                          ? 13.5
                                          : 20,
                                      top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    child: Text(
                                      "Nothing Scheduled today",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Color(0xff003A5B),
                                          fontSize: 14,
                                          fontFamily: 'quicksand',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      newList[index]['info'][ind1]['list1']
                                          .length, (ind2) {
                                    return newList[index]['info'][ind1]['list1']
                                                [ind2]['details'] ==
                                            ""
                                        ? Container()
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EventDetailsPage()));
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  80,
                                              padding: EdgeInsets.only(
                                                  left: 15,
                                                  top: 15,
                                                  bottom: 15,
                                                  right: 15),
                                              margin: EdgeInsets.only(
                                                  left: newList[index][
                                                                  'monthDate'] ==
                                                              today &&
                                                          newList[index]['info']
                                                                      [ind1]
                                                                  ['day1'] ==
                                                              currentDate &&
                                                          newList[index]['info']
                                                                      [ind1]
                                                                  ['weekDay'] ==
                                                              currentWeekDay
                                                      ? 13.5
                                                      : 20,
                                                  top: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Row(
                                                            children: <Widget>[
                                                              Expanded(
                                                                child: Container(
                                                                  child: Text(
                                                                    newList[index]['info']
                                                                                [ind1]
                                                                            ['list1'][
                                                                        ind2]['details'],
                                                                    textAlign:
                                                                        TextAlign.start,
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff003A5B),
                                                                        fontSize: 14,
                                                                        fontFamily:
                                                                            'quicksand',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          newList[index]['info'][
                                                                              ind1]
                                                                          [
                                                                          'list1'][ind2]
                                                                      [
                                                                      'details'] ==
                                                                  ""
                                                              ? Container()
                                                              : Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top: 5),
                                                                  child: Text(
                                                                    newList[index]['info'][ind1]['list1']
                                                                                [
                                                                                ind2]
                                                                            [
                                                                            'stTime'] +
                                                                        " - " +
                                                                        newList[index]
                                                                                [
                                                                                'info'][ind1]['list1'][ind2]
                                                                            [
                                                                            'endTime'],
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff354D5B),
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            'quicksand',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400),
                                                                  ),
                                                                ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  newList[index]['info'][ind1]
                                                                      ['list1']
                                                                  [ind2]
                                                              ['details'] ==
                                                          ""
                                                      ? Container()
                                                      : Container(
                                                          height: 40,
                                                          width: 40,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                      0xffDCF7EE)
                                                                  .withOpacity(
                                                                      0.5),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: Image.asset(
                                                              "${newList[index]['info'][ind1]['list1'][ind2]['pic']}"),
                                                        )
                                                ],
                                              ),
                                            ),
                                          );
                                  }))
                        ],
                      ),
                    );
                  }))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

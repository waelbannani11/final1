//library event_calendar;

import 'dart:math';
import 'package:final1/models/app.dart';
import 'package:final1/screens/deleterdv.dart';
import 'package:final1/screens/home_page.dart';
import 'package:final1/screens/modirdv.dart';
import 'package:final1/screens/patient_screens/patient_page.dart';
import 'package:final1/screens/rdv_ajout.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';

import 'create_new_rdv_page.dart';
import 'login.dart';
import 'modif.dart';

//part 'appointment-editor.dart';

//part 'timezone-picker.dart';
//part 'color-picker.dart';

class AgendaViewCustomizationPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAgendaPatient(),
    );
  }
}

class CustomAgendaPatient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

List<Color> _colorCollection;
List<String> _colorNames;
int _selectedColorIndex = 0;
int _selectedTimeZoneIndex = 0;
List<String> _timeZoneCollection;
DataSource _events;
Meeting _selectedAppointment;
DateTime _startDate;
TimeOfDay _startTime;
DateTime _endDate;
TimeOfDay _endTime;
bool _isAllDay;
String _subject = '';
String _notes = '';
bool b = false;

class ScheduleExample extends State<CustomAgendaPatient> {
  CalendarView _calendarView;
  List<Appointment> appointmentDetails;
  DateTime _jumpToTime = DateTime.now();
  String _text = '';
  Color headerColor, viewHeaderColor, calendarColor, defaultColor;
  List<String> eventNameCollection;
  List<Meeting> appointments = List<Meeting>();
  int _cIndex = 0;
  //List<Meeting> appointments;

  //List<Meeting> _app = List<Meeting>();

  /*Future<List<Meeting>> fetchNotes() async {
    var url = 'https://testjsonwael.000webhostapp.com/test11.json';
    var response = await http.get(url);

    var app = List<Meeting>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        app.add(Meeting.fromJson(noteJson));
      }
    }
    return app;
  }**/

  @override
  void initState() {
    /* fetchNotes().then((value) {
      setState(() {
        _app.addAll(value);
      });
    });**/
    appointmentDetails = <Appointment>[];
    _calendarView = CalendarView.month;
    _text = DateFormat('MMMM yyyy').format(_jumpToTime).toString();
    // appointments = _getDataFromJson() as List<Meeting>;
    appointments = getMeetingDetails();
    _events = DataSource(appointments);
    _selectedAppointment = null;
    _selectedColorIndex = 0;
    _selectedTimeZoneIndex = 0;
    _subject = '';
    _notes = '';
    super.initState();
  }

  List<String> colors = <String>[
    'Blue',
    'Yellow',
    'Wall Brown',
    'Default',
  ];

  List<String> views = <String>[
    'Day',
    'Month',
  ];
  Future<List<OnlineAppointmentData>> _getOnlineData() async {
    var data = await http.get("http://192.168.100.134:5000/Rdv");
    var jsonData = json.decode(data.body);
    List<OnlineAppointmentData> appointmentData = [];
    for (var u in jsonData) {
      OnlineAppointmentData user = OnlineAppointmentData(u['startTime'],
          u['endTime'], u['subject'], u['patientid'], u['rdvid']);
      appointmentData.add(user);
    }
    //print(appointmentData.length);
    return appointmentData;
  }

  /* Future<List<Meeting>> _getDataFromJson() async {
    var data =
        await http.get("https://testjsonwael.000webhostapp.com/test11.json");
    var jsonData = json.decode(data.body);
    List<OnlineAppointmentData> appointmentData = [];
    int i = 0;
    List<Meeting> collection;
    for (var u in jsonData) {
      i++;
      OnlineAppointmentData user = OnlineAppointmentData(
          u['StartTime'], u['EndTime'], u['Subject'], u['AllDay']);
      appointmentData.add(user);
      appointments ??= <Meeting>[];
      var meeting = appointmentData[0];
      appointments.add(
        Meeting(
            from: convertDateFromString(meeting.startTime),
            to: convertDateFromString(meeting.endTime),
            eventName: meeting.subject),
      );
    }
    print(appointmentData.length);
    return appointments;
  }**/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.restore_page),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AgendaViewCustomizationPatient()),
              );
            },
          ),
          /*PopupMenuButton<String>(
            icon: Icon(Icons.color_lens),
            itemBuilder: (BuildContext context) => colors.map((String choice) {
              return PopupMenuItem<String>(value: choice, child: Text(choice));
            }).toList(),
            onSelected: (String value) {
              setState(() {
                if (value == 'Pink') {
                  headerColor = const Color(0xFF09e8189);
                  viewHeaderColor = const Color(0xFF0f3acb6);
                  calendarColor = const Color(0xFF0ffe5d8);
                } else if (value == 'Blue') {
                  headerColor = const Color(0xFF0007eff);
                  viewHeaderColor = const Color(0xFF03aa4f6);
                  calendarColor = const Color(0xFF0bae5ff);
                } else if (value == 'Wall Brown') {
                  headerColor = const Color(0xFF0937c5d);
                  viewHeaderColor = const Color(0xFF0e6d9b1);
                  calendarColor = const Color(0xFF0d1d2d6);
                } else if (value == 'Yellow') {
                  headerColor = const Color(0xFF0f7ed53);
                  viewHeaderColor = const Color(0xFF0fff77f);
                  calendarColor = const Color(0xFF0f7f2cc);
                } else if (value == 'Default') {
                  headerColor = null;
                  viewHeaderColor = null;
                  calendarColor = null;
                }
              });
            },
          ),*/
        ],
        backgroundColor: headerColor,
        //Color(0xFF003264),
        centerTitle: true,
        titleSpacing: 60,
        title: Text(_text),
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.calendar_today),
          itemBuilder: (BuildContext context) => views.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList(),
          onSelected: (String value) {
            setState(() {
              if (value == 'Day') {
                _calendarView = CalendarView.day;
              } else if (value == 'Month') {
                _calendarView = CalendarView.month;
              }
            });
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getOnlineData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              final Random random = Random();
              List<Meeting> collection;
              if (snapshot.data != null) {
                for (int i = 0; i < snapshot.data.length; i++) {
                  collection ??= <Meeting>[];
                  var meeting = snapshot.data[i];
                  collection.add(
                    Meeting(
                      from: convertDateFromString(meeting.startTime),
                      to: convertDateFromString(meeting.endTime),
                      eventName: "rdvid:" +
                          (meeting.rdvid).toString() +
                          ' ' +
                          "patient:" +
                          meeting.subject,
                      background: _colorCollection[random.nextInt(9)],
                      patientid: meeting.patientid,
                    ),
                  );
                  appointments = collection;
                  print(appointments[0].eventName);
                }
              }
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        child: getEventCalendar(_calendarView, _events,
                            onCalendarTapped, collection)),
                  ),
                  /*Expanded(
        child: Container(
            color: Colors.black12,
            child: ListView.separated(
              padding: const EdgeInsets.all(2),
              itemCount: appointmentDetails.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.all(2),
                    height: 60,
                    color: appointmentDetails[index].color,
                    child: ListTile(
                      leading: Column(
                        children: <Widget>[
                          Text(
                            appointmentDetails[index].isAllDay
                                ? ''
                                : '${DateFormat('hh:mm a').format(appointmentDetails[index].startTime)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.7),
                          ),
                          Text(
                            appointmentDetails[index].isAllDay
                                ? 'All day'
                                : '',
                            style: TextStyle(
                                height: 0.5, color: Colors.white),
                          ),
                          Text(
                            appointmentDetails[index].isAllDay
                                ? ''
                                : '${DateFormat('hh:mm a').format(appointmentDetails[index].endTime)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      trailing: Container(
                          child: Icon(
                        getIcon(appointmentDetails[index].subject),
                        size: 30,
                        color: Colors.white,
                      )),
                      title: Container(
                          child: Text(
                              '${appointmentDetails[index].subject}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 5,
              ),
            )))**/
                ],
              );
            } else {
              return Container(
                child: Center(
                  child: Text("donnes en cours"),
                ),
              );
            }
          },
        ),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Modif()));
        },
        icon: Icon(Icons.add),
        label: Text("ajouter rdv"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.pinkAccent,
      ),**/
      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.delete, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Supprimer')),
          BottomNavigationBarItem(
              icon: Icon(Icons.update, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text('Modifier'))
        ],
        onTap: (index) {
          setState(() {
            _cIndex = index;
            switch (_cIndex) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeleteRDV()));
                //DeleteRDV
                break;
              case 1:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ModifRDV()));
                break;
            }
          });
        },
      ),**/
    );
  }

  SfCalendar getEventCalendar([
    CalendarView _calendarView,
    CalendarDataSource _getCalendarDataSource1,
    CalendarTapCallback calendarTapCallback,
    List<Meeting> collection,
  ]) {
    return SfCalendar(
        view: _calendarView,
        dataSource: _getCalendarDataSource(appointments),
        initialDisplayDate: DateTime(2020, 07, 07, 11, 0, 0),
        monthViewSettings: MonthViewSettings(
            showAgenda: true,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        timeSlotViewSettings: TimeSlotViewSettings(
            startHour: 0,
            endHour: 23,
            minimumAppointmentDuration: const Duration(minutes: 30)));
  }

  void onCalendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement != CalendarElement.calendarCell &&
        calendarTapDetails.targetElement != CalendarElement.appointment) {
      b = true;
      return;
    }
    bool tapped(CalendarTapDetails calendarTapDetails) {
      if (calendarTapDetails.targetElement != CalendarElement.calendarCell) {}
    }

    setState(() {
      _selectedAppointment = null;
      _isAllDay = false;
      _selectedColorIndex = 0;
      _selectedTimeZoneIndex = 0;
      _subject = '';
      _notes = '';
      if (_calendarView == CalendarView.month) {
        _calendarView = CalendarView.day;
      } else {
        if (calendarTapDetails.appointments != null &&
            calendarTapDetails.appointments.length > 1) {
          final Meeting meetingDetails = calendarTapDetails.appointments[0];
          _startDate = meetingDetails.from;
          _endDate = meetingDetails.to;
          _isAllDay = meetingDetails.isAllDay;
          _selectedColorIndex =
              _colorCollection.indexOf(meetingDetails.background);
          _selectedTimeZoneIndex = meetingDetails.startTimeZone == ''
              ? 0
              : _timeZoneCollection.indexOf(meetingDetails.startTimeZone);
          _subject = meetingDetails.eventName == '(No title)'
              ? ''
              : meetingDetails.eventName;
          _notes = meetingDetails.description;
          _selectedAppointment = meetingDetails;
        } else {
          final DateTime date = calendarTapDetails.date;
          _startDate = date;
          _endDate = date.add(const Duration(hours: 1));
        }
        _startTime =
            TimeOfDay(hour: _startDate.hour, minute: _startDate.minute);
        _endTime = TimeOfDay(hour: _endDate.hour, minute: _endDate.minute);
        Navigator.push<Widget>(
            context,
            MaterialPageRoute(
              //builder: (BuildContext context) => Modif(),
              settings: RouteSettings(arguments: appointments),
            ));
      }
    });
  }

  /*void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell &&
        _calendarView == CalendarView.month) {
      setState(() {
        appointmentDetails = calendarTapDetails.appointments;
        _calendarView = CalendarView.day;
        _updateState(calendarTapDetails.date);
      });
    }
  }**/

  /*List<Meeting> getMeetingFromJson() {
    final List<Meeting> meetingCollection = <Meeting>[];

    var list = _getOnlineData();
    for (var v in list) {}
    print(list);
    /*FutureBuilder(
        future: _getOnlineData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            List<Meeting> collection;
            if (snapshot.data != null) {
              for (int i = 0; i < snapshot.data.length; i++) {
                collection ??= <Meeting>[];
                var meeting = snapshot.data[i];
                collection.add(
                  Meeting(
                      eventName: meeting.subject,
                      from: convertDateFromString(meeting.startTime),
                      to: convertDateFromString(meeting.endTime),
                      background: Colors.red,
                      isAllDay: meeting.allDay),
                );
              }
            }
          }
        });**/
  }**/

  List<Meeting> getMeetingDetails() {
    final List<Meeting> meetingCollection = <Meeting>[];
    eventNameCollection = <String>[];
    eventNameCollection.add('General Meeting');
    eventNameCollection.add('Plan Execution');
    eventNameCollection.add('Project Plan');
    eventNameCollection.add('Consulting');
    eventNameCollection.add('Support');
    eventNameCollection.add('Development Meeting');
    eventNameCollection.add('Scrum');
    eventNameCollection.add('Project Completion');
    eventNameCollection.add('Release updates');
    eventNameCollection.add('Performance Check');

    _colorCollection = <Color>[];
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF85461E));
    _colorCollection.add(const Color(0xFFFF00FF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));

    _colorNames = <String>[];
    _colorNames.add('Green');
    _colorNames.add('Purple');
    _colorNames.add('Red');
    _colorNames.add('Orange');
    _colorNames.add('Caramel');
    _colorNames.add('Magenta');
    _colorNames.add('Blue');
    _colorNames.add('Peach');
    _colorNames.add('Gray');

    final DateTime today = DateTime.now();
    final Random random = Random();
    for (int month = -1; month < 2; month++) {
      for (int day = -5; day < 5; day++) {
        for (int hour = 9; hour < 18; hour += 5) {
          meetingCollection.add(Meeting(
            from: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour)),
            to: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour + 2)),
            background: _colorCollection[random.nextInt(9)],
            startTimeZone: '',
            endTimeZone: '',
            description: '',
            isAllDay: false,
            eventName: eventNameCollection[random.nextInt(7)],
          ));
        }
      }
    }

    return meetingCollection;
  }

  void _updateState(DateTime date) {
    setState(() {
      _jumpToTime = date.add(const Duration(hours: 3, minutes: 30));
      _text = DateFormat('MMMM yyyy').format(_jumpToTime).toString();
    });
  }

  IconData getIcon(String subject) {
    if (subject == 'Planning') {
      return Icons.subject;
    } else if (subject == 'Development Meeting   New York, U.S.A') {
      return Icons.people;
    } else if (subject == 'Support - Web Meeting   Dubai, UAE') {
      return Icons.settings;
    } else if (subject == 'Project Plan Meeting   Kuala Lumpur, Malaysia') {
      return Icons.check_circle_outline;
    } else if (subject == 'Retrospective') {
      return Icons.people_outline;
    } else if (subject == 'Project Release Meeting   Istanbul, Turkey') {
      return Icons.people_outline;
    } else if (subject == 'Customer Meeting   Tokyo, Japan') {
      return Icons.settings_phone;
    } else if (subject == 'Release Meeting') {
      return Icons.view_day;
    } else {
      return Icons.beach_access;
    }
  }
}

/*DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 4)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 5)),
      subject: 'Development Meeting   New York, U.S.A',
      color: Color(0xFFf527318),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 3)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 4)),
      subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
      color: Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 2)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 3)),
      subject: 'Support - Web Meeting   Dubai, UAE',
      color: Color(0xFFf3282b8),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 1)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 2)),
      subject: 'Project Release Meeting   Istanbul, Turkey',
      color: Color(0xFFf2a7886),
    ));
    appointments.add(Appointment(
        startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
        endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
        subject: 'Release Meeting',
        color: Colors.lightBlueAccent,
        isAllDay: true));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
      endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
      subject: 'Customer Meeting   Tokyo, Japan',
      color: Color(0xFFffb8d62),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return DataSource(appointments);
  }**/

/* IconData getIcon(String subject) {
    if (subject == 'Planning') {
      return Icons.subject;
    } else if (subject == 'Development Meeting   New York, U.S.A') {
      return Icons.people;
    } else if (subject == 'Support - Web Meeting   Dubai, UAE') {
      return Icons.settings;
    } else if (subject == 'Project Plan Meeting   Kuala Lumpur, Malaysia') {
      return Icons.check_circle_outline;
    } else if (subject == 'Retrospective') {
      return Icons.people_outline;
    } else if (subject == 'Project Release Meeting   Istanbul, Turkey') {
      return Icons.people_outline;
    } else if (subject == 'Customer Meeting   Tokyo, Japan') {
      return Icons.settings_phone;
    } else if (subject == 'Release Meeting') {
      return Icons.view_day;
    } else {
      return Icons.beach_access;
    }
  }**/
DateTime convertDateFromString(String date) {
  DateTime todayDate = DateTime.parse(date);
  return todayDate;
}

DataSource _getCalendarDataSource([List<Meeting> collection]) {
  List<Meeting> meetings = collection ?? <Meeting>[];
  return DataSource(meetings);
}

DataSource _getCalendarDataSource1(appointments) {
  List<Meeting> meetings = appointments ?? <Meeting>[];
  return DataSource(meetings);
}

class DataSource extends CalendarDataSource {
  DataSource(List<Meeting> source) {
    appointments = source;
  }
  @override
  bool isAllDay(int index) => appointments[index].isAllDay;

  @override
  String getSubject(int index) => appointments[index].eventName;

  @override
  String getStartTimeZone(int index) => appointments[index].startTimeZone;

  @override
  String getNotes(int index) => appointments[index].description;

  @override
  String getEndTimeZone(int index) => appointments[index].endTimeZone;

  @override
  Color getColor(int index) => appointments[index].background;

  @override
  DateTime getStartTime(int index) => appointments[index].from;

  @override
  DateTime getEndTime(int index) => appointments[index].to;
}

class OnlineAppointmentData {
  String startTime;
  String endTime;
  String subject;
  String patientid;
  int rdvid;
  //bool allDay;

  OnlineAppointmentData(this.startTime, this.endTime, this.subject,
      this.patientid, this.rdvid /*, this.allDay**/);
}

class Meeting {
  Meeting(
      {@required this.from,
      @required this.to,
      this.background = Colors.green,
      this.isAllDay = false,
      this.eventName = '',
      this.startTimeZone = '',
      this.endTimeZone = '',
      this.description = '',
      this.patientid});

  String eventName;
  DateTime from;
  DateTime to;
  String patientid;
  Color background;
  bool isAllDay;
  String startTimeZone;
  String endTimeZone;
  String description;

  Meeting.fromJson(Map<String, dynamic> json) {
    eventName = json['rdvid'].toString();
    from = json['StartTime'];
    to = json['EndTime'];
    patientid = json['patientid'];
    isAllDay = json['AllDay'];
  }
}

class App {
  String subject;
  String startTime;
  String endTime;
  bool allDay;

  App(this.allDay, this.endTime, this.startTime, this.subject);

  App.fromJson(Map<String, dynamic> json) {
    subject = json['Subject'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    allDay = json['AllDay'];
  }
}

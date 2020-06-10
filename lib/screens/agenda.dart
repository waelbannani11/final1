library event_calendar;
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
part 'appointment-editor.dart';


part 'timezone-picker.dart';
part 'color-picker.dart';

class AgendaViewCustomization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAgenda(),
    );
  }
}

class CustomAgenda extends StatefulWidget {
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

class ScheduleExample extends State<CustomAgenda> {
  CalendarView _calendarView;
  //List<Appointment> appointmentDetails;
   DateTime _jumpToTime = DateTime.now();
   String _text='';
    Color headerColor, viewHeaderColor, calendarColor, defaultColor;
     List<String> eventNameCollection;
  List<Meeting> appointments;

  @override
  void initState() {
   // appointmentDetails = <Appointment>[];
    _calendarView = CalendarView.month;
    _text = DateFormat('MMMM yyyy').format(_jumpToTime).toString();
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
    var data = await http.get(
        "https://js.syncfusion.com/demos/ejservices/api/Schedule/LoadData");
    var jsonData = json.decode(data.body);
    List<OnlineAppointmentData> appointmentData = [];
    for (var u in jsonData) {
      OnlineAppointmentData user = OnlineAppointmentData(
          u['StartTime'], u['EndTime'], u['Subject'], u['AllDay']);
      appointmentData.add(user);
    }
    print(appointmentData.length);
    return appointmentData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
              appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(Icons.color_lens),
              itemBuilder: (BuildContext context) =>
                  colors.map((String choice) {
                return PopupMenuItem<String>(
                    value: choice, child: Text(choice));
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
            ),
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
              List<Meeting> collection;
              if (snapshot.data != null) {
                for (int i = 0; i < snapshot.data.length; i++) {
                  collection ??= <Meeting>[];
                  var meeting= snapshot.data[i];
                  collection.add(
                    Meeting(
                        eventName: meeting.subject,
                        from: convertDateFromString(meeting.startTime),
                        to: convertDateFromString(meeting.endTime),
                        background: Colors.red,
                        isAllDay: meeting.allDay),
                  );
                }
              }return Container(
        
        child: getEventCalendar(_calendarView, _events, onCalendarTapped,collection));
            
            } else {
              return Container(
                child: Center(
                  child: Text('loading...'),
                ),
              );
            }
            },
            
      
    ),
    ),
    );
    
  }
    SfCalendar getEventCalendar(
      [CalendarView _calendarView,
      CalendarDataSource _calendarDataSource,
      CalendarTapCallback calendarTapCallback,
      List<Meeting> collection,
      ]) {
    return SfCalendar(
        view: _calendarView,
        dataSource: _getCalendarDataSource(collection),
        onTap: calendarTapCallback,
        initialDisplayDate:  DateTime(2017, 6, 23, 9, 0, 0),
        monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        timeSlotViewSettings: TimeSlotViewSettings(
          startHour: 1,
          endHour: 23,
            minimumAppointmentDuration: const Duration(minutes: 30)));
  }
    void onCalendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement != CalendarElement.calendarCell &&
        calendarTapDetails.targetElement != CalendarElement.appointment) {
      return;
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
            calendarTapDetails.appointments.length == 1) {
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
              builder: (BuildContext context) => AppointmentEditor()),
        );
      }
    });
  }

  void calendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell
    && _calendarView == CalendarView.month) {
      setState(() {
       // appointmentDetails = calendarTapDetails.appointments;
        _calendarView=CalendarView.day;
        _updateState(calendarTapDetails.date);
      });
    }
  }
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
} 
DataSource _getCalendarDataSource([List<Meeting> collection]) {
  List<Meeting> meetings = collection ?? <Meeting>[];
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
  bool allDay;
  

  OnlineAppointmentData(
      this.startTime, this.endTime, this.subject, this.allDay);
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
     this.description = ''});

  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;
  final String startTimeZone;
  final String endTimeZone;
  final String description;
}
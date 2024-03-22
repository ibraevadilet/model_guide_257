import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:model_guide_257/data/calendar_hive_model.dart/calendar_hive_model.dart';
import 'package:model_guide_257/images/app_generate_images.dart';
import 'package:model_guide_257/main.dart';
import 'package:table_calendar/table_calendar.dart';

class NavBar1Page extends StatefulWidget {
  const NavBar1Page({super.key});

  @override
  State<NavBar1Page> createState() => _NavBar1PageState();
}

class _NavBar1PageState extends State<NavBar1Page> {
  List<CalendarHiveModel> plans = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    plans = calHive.values
        .where((e) => e.date == DateFormat('dd.MM.yyyy').format(DateTime.now()))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        centerTitle: false,
      ),
      body: ISSCROLLL(
        isScrolled: plans.isEmpty,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 3,
                      spreadRadius: 2,
                      color: Colors.grey.shade300,
                    )
                  ],
                ),
                child: TableCalendar(
                  locale: 'en_EN',
                  daysOfWeekVisible: false,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  headerStyle: HeaderStyle(
                    leftChevronIcon: const Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                      size: 33,
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 33,
                    ),
                    titleTextStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                    titleCentered: true,
                    titleTextFormatter: (date, locale) =>
                        DateFormat('MMMM yyyy').format(date),
                    formatButtonVisible: false,
                    headerPadding: const EdgeInsets.only(top: 20, bottom: 30),
                    rightChevronPadding: const EdgeInsets.only(right: 30),
                    leftChevronPadding: const EdgeInsets.only(left: 30),
                  ),
                  calendarStyle: CalendarStyle(
                    cellPadding: const EdgeInsets.only(right: 5, bottom: 5),
                    cellAlignment: Alignment.bottomRight,
                    todayDecoration: const BoxDecoration(
                      color: Color(0xff00C8FF),
                    ),
                    defaultDecoration: BoxDecoration(
                      color: const Color(0xff00C8FF).withOpacity(0.25),
                    ),
                    weekendDecoration: BoxDecoration(
                      color: const Color(0xff00C8FF).withOpacity(0.25),
                    ),
                    outsideDaysVisible: false,
                    defaultTextStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                    ),
                    weekendTextStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                    ),
                    todayTextStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  rangeSelectionMode: RangeSelectionMode.toggledOff,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Plans for today',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      titleDialog(context);
                    },
                    child: Image.asset(
                      AppGenerateImages.addIcon,
                      height: 32.h,
                    ),
                  ),
                ],
              ),
            ),
            plans.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        'You have no plans for today',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Inter',
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: plans.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) => PlansWidget(
                      model: plans[index],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> titleDialog(BuildContext context) {
    return showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState2) {
        return CupertinoAlertDialog(
          title: const Text(
            "Title",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
                const Text(
                  "Write the title",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                CupertinoTextField(
                  onChanged: (value) {
                    setState2(() {});
                  },
                  controller: controller,
                  cursorHeight: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300,
                  ),
                  placeholder: "Enter",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text(
                "Exit",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                controller.clear();
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: controller.text.isEmpty
                      ? const Color(0xff00C8FF).withOpacity(0.4)
                      : const Color(0xff00C8FF),
                ),
              ),
              onPressed: () async {
                Navigator.pop(context);
                timeDialog(context);
              },
            )
          ],
        );
      }),
    );
  }

  Future<dynamic> timeDialog(BuildContext context) {
    DateTime initialDateTime = DateTime.now();
    return showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text(
          "Time",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              const Text(
                "Set the time",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 100.h,
                child: CupertinoDatePicker(
                  initialDateTime: initialDateTime,
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (value) {
                    initialDateTime = value;
                    print(DateFormat('hh:mm a').format(initialDateTime));
                  },
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text(
              "Exit",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              controller.clear();
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              "Add",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: Color(0xff00C8FF),
              ),
            ),
            onPressed: () async {
              calHive.add(
                CalendarHiveModel(
                  date: DateFormat('dd.MM.yyyy').format(DateTime.now()),
                  title: controller.text,
                  time: DateFormat('hh:mm a').format(initialDateTime),
                ),
              );
              Navigator.pop(context);
              plans = List.from(calHive.values
                  .where((e) =>
                      e.date == DateFormat('dd.MM.yyyy').format(DateTime.now()))
                  .toList());
              setState(() {});
              controller.clear();
            },
          )
        ],
      ),
    );
  }
}

class PlansWidget extends StatefulWidget {
  const PlansWidget({
    super.key,
    required this.model,
  });

  final CalendarHiveModel model;

  @override
  State<PlansWidget> createState() => _PlansWidgetState();
}

class _PlansWidgetState extends State<PlansWidget> {
  late bool isCheck = widget.model.isChecked;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.model.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffF5F5F5),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                color: Colors.grey.shade300,
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.model.time,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isCheck = !isCheck;
                  });
                  widget.model.isChecked = isCheck;
                  widget.model.save();
                },
                child: Image.asset(
                  isCheck
                      ? AppGenerateImages.timeChecked
                      : AppGenerateImages.timeNotCheck,
                  height: 32.h,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ISSCROLLL extends StatelessWidget {
  const ISSCROLLL({
    super.key,
    required this.child,
    required this.isScrolled,
  });
  final bool isScrolled;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isScrolled ? child : SingleChildScrollView(child: child);
  }
}

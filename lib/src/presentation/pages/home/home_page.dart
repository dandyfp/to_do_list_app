import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo_list_app/src/presentation/misc/constant.dart';
import 'package:todo_list_app/src/presentation/misc/date_format.dart';
import 'package:todo_list_app/src/presentation/misc/methods.dart';
import 'package:todo_list_app/src/presentation/misc/style.dart';
import 'package:todo_list_app/src/presentation/widgets/button.dart';
import 'package:todo_list_app/src/presentation/widgets/fab.dart';
import 'package:todo_list_app/src/presentation/widgets/textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController titleController = TextEditingController();
TextEditingController descController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController searchController = TextEditingController();

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: FAB(
        onTap: () {
          bottomSheetAddTask(context);
        },
      ),
      body: ListView(
        children: [
          verticalSpace(20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: primaryDarkColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.8),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: KTextField(
                    isDense: true,
                    maxLines: 1,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    controller: searchController,
                    borderColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: ghostWhite,
                    ),
                  ),
                ),
                Text(
                  'To-Do List',
                  style: whiteSemiBoldTextStyle.copyWith(fontSize: 20),
                )
              ],
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Card(
                  color: whiteColor,
                  child: ExpansionTile(
                    shape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20)),
                    collapsedShape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: whiteColor,
                    expandedAlignment: Alignment.topLeft,
                    title: Row(
                      children: [
                        Checkbox.adaptive(
                          value: true,
                          onChanged: (value) {},
                        ),
                        Text(
                          'Ini adalah title',
                          style: blackMediumTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '20-01-2024',
                              style:
                                  blackRegularTextStyle.copyWith(fontSize: 14),
                            ),
                            verticalSpace(10),
                            Text(
                              'Ini adalah deskripsi untuk saya dan dia',
                              style:
                                  blackRegularTextStyle.copyWith(fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> bottomSheetAddTask(BuildContext context) {
    return showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(20),
                Center(
                  child: Container(
                    height: 3,
                    width: 77,
                    color: primaryColor,
                  ),
                ),
                verticalSpace(20),
                KTextField(
                  maxLines: 1,
                  minLines: 1,
                  isActiveFocusBorder: true,
                  controller: titleController,
                  keyboardType: TextInputType.name,
                  borderColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  label: 'Title',
                  placeholder: 'Input title',
                ),
                verticalSpace(10),
                KTextField(
                  maxLines: 3,
                  minLines: 3,
                  isActiveFocusBorder: true,
                  controller: descController,
                  keyboardType: TextInputType.multiline,
                  borderColor: Colors.black,
                  textInputAction: TextInputAction.newline,
                  textCapitalization: TextCapitalization.sentences,
                  placeholder: 'Input description',
                  label: 'Description',
                ),
                verticalSpace(10),
                KTextField(
                  maxLines: 1,
                  minLines: 1,
                  isOption: true,
                  controller: dateController,
                  isActiveFocusBorder: true,
                  keyboardType: TextInputType.name,
                  borderColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  placeholder: 'Choose date',
                  label: 'Date',
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                  onTap: () {
                    showDatePicker(context);
                  },
                ),
                verticalSpace(20),
                Button(
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Add Task',
                      style: whiteMediumTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                ),
                verticalSpace(40),
              ],
            ),
          ),
        );
      },
    );
  }

  showDatePicker(BuildContext context) {
    AlertDialog alert = AlertDialog(
      surfaceTintColor: whiteColor,
      backgroundColor: whiteColor,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SfDateRangePicker(
              backgroundColor: whiteColor,
              onSelectionChanged:
                  (DateRangePickerSelectionChangedArgs value) {},
              showActionButtons: true,
              confirmText: 'Confirm',
              cancelText: 'Cancel',
              onCancel: () {
                Navigator.pop(context);
              },
              onSubmit: (val) {
                setState(() {
                  dateController.text = FormatDate().formatDate(val.toString(),
                      context: context, format: 'dd MMMM yyyy');
                });
                Navigator.pop(context);
              },
              selectionColor: primaryColor,
              todayHighlightColor: primaryColor,
              rangeSelectionColor: primaryColor.withOpacity(0.75),
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

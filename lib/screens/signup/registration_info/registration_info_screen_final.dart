import 'dart:io';

import 'package:aytamy/common/stats_widgets.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:aytamy/screens/signup/model/city.dart';
import 'package:aytamy/screens/signup/model/job.dart';
import 'package:aytamy/screens/signup/model/nationality.dart';
import 'package:aytamy/screens/signup/provider/registrationModel.dart';
import 'package:date_format/date_format.dart' as Format;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../app/route.dart';

class RegistrationInfoFinalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationInfoFinalScreenState();
  }
}

class _RegistrationInfoFinalScreenState
    extends State<RegistrationInfoFinalScreen> {
  DateTime selectedDate;
  RegistrationModel _registrationModel = RegistrationModel();
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  List<Job> dropdownJobList = [];
  List<City> dropdownCityList = [];
  List<Nationality> dropdownNationalityList = [];
  Job _selectedDropdownJobValue;
  City _selectedDropdownCityValue;
  Nationality _selectedDropdownNationalityValue;
  File _profileImagePath;
  final picker = ImagePicker();

  @override
  void initState() {
    showLoading(context);
    RegistrationModel().getJobs(onSuccess: (response) {
      setState(() {
        dropdownJobList.addAll(response);
      });

      dismissLoading();
    }, onError: (error) {
      dismissLoading();
    });

    showLoading(context);
    RegistrationModel().getCities(onSuccess: (response) {
      setState(() {
        dropdownCityList.addAll(response);
      });
      dismissLoading();
    }, onError: (error) {
      dismissLoading();
    });

    showLoading(context);
    RegistrationModel().getNationalities(onSuccess: (response) {
      setState(() {
        dropdownNationalityList.addAll(response);
      });
      dismissLoading();
    }, onError: (error) {
      dismissLoading();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    print("SignUpScreen ---> Build()");
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(S.current.myInfo,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "GESSTwoBold",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.center),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, size: 22, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    (_profileImagePath?.path != null)
                        ? Image.file(
                            _profileImagePath,
                            height: MediaQuery.of(context).size.height * .35,
                            width: MediaQuery.of(context).size.width * .98,
                            fit: BoxFit.fill,
                          )
                        : Container(
                            margin: EdgeInsets.all(20),
                            height: 128.00436401367188,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/logo.png",
                              height: MediaQuery.of(context).size.height * .35,
                            ),
                          ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //////////////////////
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                          "جميع  المعلومات التي يتم جمعها عنك سرية ولن تتم مشاركتها مع أي منصاتخارجية او الاشهار بها",
                          style: const TextStyle(
                              color: const Color(0xffdb0011),
                              fontWeight: FontWeight.w800,
                              fontFamily: "GESSTwoBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Rectangl
                    GestureDetector(
                      child: Container(
                          width: MediaQuery.of(context).size.width * .80,
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: Colors.red, width: 1.7)),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (selectedDate != null)
                                    ? dateFormat.format(selectedDate).toString()
                                    : S.current.birthDate,
                                style: TextStyle(
                                    color: const Color(0xffdb0011),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "GESSTwoBold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0),
                              ),
                              Icon(
                                Icons.person,
                                color: Colors.red,
                              )
                            ],
                          )),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    getDropDownJobsView(),
                    SizedBox(
                      height: 22,
                    ),
                    getDropDownNationalityView(),
                    SizedBox(
                      height: 22,
                    ),
                    getDropDownCitiesView(),

                    SizedBox(
                      height: 22,
                    ),
                    // Rectangle

                    Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffdb0011)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 22,
                          ),
                          InkWell(
                            child: Text(S.current.continueText,
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "GESSTwoBold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 21.0),
                                textAlign: TextAlign.left),
                            onTap: () {
                              String BirthDate = Format.formatDate(selectedDate, [Format.yyyy, '-', Format.mm, '-', Format.dd]);
                              showLoading(context);
                              _registrationModel.updateUserData(
                                  birthDate: BirthDate,
                                  jobId: _selectedDropdownJobValue?.id,
                                  nationalityId: _selectedDropdownJobValue?.id,
                                  countryID: _selectedDropdownCityValue?.id,
                                  profileImagePath: _profileImagePath,
                                  onSuccess: () {
                                    dismissLoading();
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            Routes.HOME, (route) => false);
                                  },
                                  onError: (error) {
                                    showError(error.toString());
                                    dismissLoading();
                                  });
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 18),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 22,
                    ),
                    // Rectangle
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            )),
      ),
    );
  }

  Widget getDropDownJobsView() {
    return Container(
        width: MediaQuery.of(context).size.width * .80,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.red, width: 1.7)),
        child: DropdownButton<Job>(
          hint: Padding(
            child: Text(
              S.current.job,
              style: TextStyle(
                  color: const Color(0xffdb0011),
                  fontWeight: FontWeight.w900,
                  fontFamily: "GESSTwoBold",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
          icon: Icon(
            Icons.work,
            color: Colors.red,
          ),
          value: _selectedDropdownJobValue,
          underline: Container(
            height: 2,
          ),
          onChanged: (Job newValue) {
            setState(() {
              _selectedDropdownJobValue = newValue;
            });
          },
          items: dropdownJobList?.map<DropdownMenuItem<Job>>((Job value) {
            return DropdownMenuItem<Job>(
              value: value,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  value.name,
                  style: TextStyle(
                      color: const Color(0xffdb0011),
                      fontWeight: FontWeight.w900,
                      fontFamily: "GESSTwoBold",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                ),
              ),
            );
          })?.toList(),
        ));
  }

  Widget getDropDownCitiesView() {
    return Container(
        width: MediaQuery.of(context).size.width * .80,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.red, width: 1.7)),
        child: DropdownButton<City>(
          hint: Padding(
            child: Text(
              S.current.city,
              style: TextStyle(
                  color: const Color(0xffdb0011),
                  fontWeight: FontWeight.w900,
                  fontFamily: "GESSTwoBold",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
          icon: Icon(
            Icons.add_location_alt,
            color: Colors.red,
          ),
          value: _selectedDropdownCityValue,
          underline: Container(
            height: 2,
          ),
          onChanged: (City newValue) {
            setState(() {
              _selectedDropdownCityValue = newValue;
            });
          },
          items: dropdownCityList?.map<DropdownMenuItem<City>>((City value) {
            return DropdownMenuItem<City>(
              value: value,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  value.name,
                  style: TextStyle(
                      color: const Color(0xffdb0011),
                      fontWeight: FontWeight.w900,
                      fontFamily: "GESSTwoBold",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                ),
              ),
            );
          })?.toList(),
        ));
  }

  Widget getDropDownNationalityView() {
    return Container(
        width: MediaQuery.of(context).size.width * .80,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.red, width: 1.7)),
        child: DropdownButton<Nationality>(
          hint: Padding(
            child: Text(
              S.current.nationality,
              style: TextStyle(
                  color: const Color(0xffdb0011),
                  fontWeight: FontWeight.w900,
                  fontFamily: "GESSTwoBold",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
          icon: Icon(
            Icons.flag_sharp,
            color: Colors.red,
          ),
          value: _selectedDropdownNationalityValue,
          underline: Container(
            height: 2,
          ),
          onChanged: (Nationality newValue) {
            setState(() {
              _selectedDropdownNationalityValue = newValue;
            });
          },
          items: dropdownNationalityList
              ?.map<DropdownMenuItem<Nationality>>((Nationality value) {
            return DropdownMenuItem<Nationality>(
              value: value,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  value.name,
                  style: TextStyle(
                      color: const Color(0xffdb0011),
                      fontWeight: FontWeight.w900,
                      fontFamily: "GESSTwoBold",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                ),
              ),
            );
          })?.toList(),
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _profileImagePath = File(pickedFile.path);
    // var le = await _profileImagePath.length();
    setState(() {
      if (pickedFile != null) {
        // print("getImage length --->" + le.toString());
      } else {
        print('No image selected.');
      }
    });
  }
}

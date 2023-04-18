import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../../constant/NavigationService.dart';
import '../../../../constant/color_manager.dart';
import '../../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../component/app_component/custom_text.dart';
import 'descriptionhistory.dart';
class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      LayoutCubit.get(context).getPatientMedicalHistory();
  }
  @override
  Widget build(BuildContext context) {
    var layoutCubit =BlocProvider.of<LayoutCubit>(context,listen: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: textcolor,
        onPressed: () {
          NavigationService
              .instance.navigationKey!.currentState!
              .pushNamed(
            "addMedicalHistory",
          );

        },
        child: Icon(Icons.add),

      ),
      backgroundColor: Colors.grey.shade100,


      body: Timeline.builder(itemBuilder: (context,index)=>TimelineModel(

        GestureDetector(
          onTap: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionHistory(index: index,)));
          },
          child: Container(
            color: Colors.transparent,
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.all(5),
            child: Card(
              shadowColor: grey,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Image.network(
                    layoutCubit.patientMedicalHistoryModel[index].medicalPhoto,
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  CustomText(
                    text: layoutCubit.patientMedicalHistoryModel[index].date,
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ),
        icon: Icon(Icons.receipt, color: Colors.white),
        iconBackground: maincolor,

      ),itemCount: layoutCubit.patientMedicalHistoryModel.length,shrinkWrap: true,
        primary: true,

        position: TimelinePosition.Center,
        iconSize: 50,
        lineColor: textcolor,
      ),
    );
  }
}

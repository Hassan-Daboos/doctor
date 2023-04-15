import 'package:flutter/material.dart';

import '../../../../constant/color_manager.dart';
import '../../../../model/medical_history_model.dart';
import '../../../component/app_component/custom_text.dart';
import '../../../component/app_component/imageDetailScreen.dart';

class DescriptionHistory extends StatelessWidget {
  MedicalHistoryModel medicalHistoryModel;

  DescriptionHistory({
    required this.medicalHistoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'Description History',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textcolor,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                      image: medicalHistoryModel.medicalPhoto,
                    );
                  }));
                },
                child: Hero(
                  tag: 'imageHero',
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            medicalHistoryModel.medicalPhoto,
                            width: 100,
                            height: MediaQuery.of(context).size.height / 3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                      child: Text(
                        medicalHistoryModel.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                      child: Text(
                        '${medicalHistoryModel.date}',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                      child: Text(
                        'No detailed explanation has been added yet ...',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

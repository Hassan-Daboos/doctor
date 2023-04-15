abstract class LayoutStates{}
class LayoutInitialState extends LayoutStates{}
class ChangeIndexState extends LayoutStates{}

//sessions

class GetSessionsLoadingState extends LayoutStates {}
class GetSessionsSuccessState extends LayoutStates {}
class GetSessionsErrorState extends LayoutStates {

}

class DeleteSessionsLoadingState extends LayoutStates {}
class DeleteSessionsSuccessState extends LayoutStates {}
class DeleteSessionsErrorState extends LayoutStates {

}

class DeleteAllSessionsLoadingState extends LayoutStates {}
class DeleteAllSessionsSuccessState extends LayoutStates {}
class DeleteAllSessionsErrorState extends LayoutStates {

}
class PatientMedicalHistoryLoadingState extends LayoutStates {}
class PatientMedicalHistorySuccessState extends LayoutStates {}
class PatientMedicalHistoryErrorState extends LayoutStates {

}
class PhotoPickedSuccessState extends LayoutStates {}
class PhotoPickedErrorState extends LayoutStates {}
class PhotoPickedRemovedState extends LayoutStates {

}
class CreateMedicalHistoryLoadingState extends LayoutStates {}
class CreateMedicalHistorySuccessState extends LayoutStates {}
class CreateMedicalHistoryErrorState extends LayoutStates {

}
class UpdateDataLoadingState extends LayoutStates {}
class UpdateDataSuccessState extends LayoutStates {}
class UpdateDataErrorState extends LayoutStates {

}
class GetUserDataLoadingState extends LayoutStates {}
class GetUserDataSuccessState extends LayoutStates {}
class GetUserDataErrorState extends LayoutStates {

}

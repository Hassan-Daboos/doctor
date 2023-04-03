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

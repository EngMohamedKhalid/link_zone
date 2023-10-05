class NetworkResponseHandler{
  void Function(String json)? onSuccess;
  void Function(String error)? onError;
  void Function()? onNeedActivation;
  void Function()? onUnAuthenticated;
  void Function()? onBlocked;
}
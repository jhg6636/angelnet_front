enum NotificationType {

  signUp(english: "SIGN_UP"),
  documentSubmissionRequest(english: "DOCUMENT_SUBMISSION_REQUEST"),
  depositRequest(english: "DEPOSIT_REQUEST"),
  requestRemind(english: "REQUEST_REMIND"),
  fundNoticeRegistered(english: "FUND_NOTICE_REGISTERED"),
  angelnetNoticeRegistered(english: "ANGELNET_NOTICE_REGISTERED"),
  submissionReviewComplete(english: "SUBMISSION_REVIEW_COMPLETE"),
  newFund(english: "NEW_FUND"),
  newUser(english: "NEW_USER"),
  adminMadeUserFirstLogin(english: "ADMIN_MADE_USER_FIRST_LOGIN"),
  documentReviewRequest(english: "DOCUMENT_REVIEW_REQUEST"),
  depositReviewRequest(english: "DEPOSIT_REVIEW_REQUEST")
  ;

  final String english;

  const NotificationType({required this.english});

  factory NotificationType.fromEnglish(String english) {
    switch (english) {
      case "SIGN_UP":
        return NotificationType.signUp;
      case "DOCUMENT_SUBMISSION_REQUEST":
        return NotificationType.documentSubmissionRequest;
      case "DEPOSIT_REQUEST":
        return NotificationType.depositRequest;
      case "REQUEST_REMIND":
        return NotificationType.requestRemind;
      case "FUND_NOTICE_REGISTERED":
        return NotificationType.fundNoticeRegistered;
      case "ANGELNET_NOTICE_REGISTERED":
        return NotificationType.angelnetNoticeRegistered;
      case "SUBMISSION_REVIEW_COMPLETE":
        return NotificationType.submissionReviewComplete;
      case "NEW_FUND":
        return NotificationType.newFund;
      case "NEW_USER":
        return NotificationType.newUser;
      case "ADMIN_MADE_USER_FIRST_LOGIN":
        return NotificationType.adminMadeUserFirstLogin;
      case "DOCUMENT_REVIEW_REQUEST":
        return NotificationType.documentReviewRequest;
      case "DEPOSIT_REVIEW_REQUEST":
        return NotificationType.depositReviewRequest;
      default:
        throw Exception();
    }
  }

  Function() getAction(Function()? setState) {
    return () {
      setState;
    };
  }

}
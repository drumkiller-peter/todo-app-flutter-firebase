class DbKeys {
  DbKeys._();

  //Tables Name
  static const String users = 'users';
  static const String event = 'event';
  static const String completedEvents = 'completed_events';

//fields names
  static const String fullName = 'full_name';
  static const String dob = 'date_of_birth';
  static const String uId = 'uid';
  static const String uuid = 'uuid';
  static const String profilePicture = 'profile_picture';

  //Categories
  static const String category = 'category';
  static const String categoryTitle = 'category_title';
  static const String categoryId = 'category_id';
  static const String categoryDescription = 'category_description';

  //create TODOs
  static const String eventStartDate = 'event_start_date';
  static const String eventEndDate = 'event_end_date';
  static const String eventStartTime = 'event_start_time';
  static const String eventEndTime = 'event_end_time';
  static const String isEventCompleted = 'is_event_completed';
  static const String eventTitle = 'event_title';
  static const String eventDescription = 'event_description';
  static const String createdAt = 'created_at';
  static const String isSyncedWithGoogleCalendar =
      'is_synced_with_google_calendar';
  static const String mediaUrl = 'media_url';
  static const String isImage = 'is_image';

  //Completion Model
  static const String completedAt = 'completed_at';
  static const String rateOfCompletion = 'rate_of_completion';
}

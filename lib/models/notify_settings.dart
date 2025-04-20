class NotifySettings {
  final String notifyTitle;
  const NotifySettings({required this.notifyTitle});
}

List<NotifySettings> notifyItems = [
  NotifySettings(notifyTitle: 'General Settings'),
  NotifySettings(notifyTitle: 'Sound'),
  NotifySettings(notifyTitle: 'Sound Call'),
  NotifySettings(notifyTitle: 'Vibrate'),
  NotifySettings(notifyTitle: 'Transaction Update'),
  NotifySettings(notifyTitle: 'Expense Reminder'),
  NotifySettings(notifyTitle: 'Budget Settings'),
  NotifySettings(notifyTitle: 'Low Balance Alerts'),
];

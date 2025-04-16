import 'package:flutter/material.dart';

class NotificationData {
  final IconData icon;
  final String title;
  final String contents;
  final String time;

  const NotificationData({
    required this.icon,
    required this.title,
    required this.contents,
    required this.time,
  });
}

List<NotificationData> dailyNotifications = [
  NotificationData(
    icon: Icons.notifications_outlined, 
    title: 'Reminder!', 
    contents: 'Set up your automatic savings to meet your savings goal...', 
    time: '17:00 - April 24',),
    NotificationData(
    icon: Icons.star, 
    title: 'New update', 
    contents: 'Set up your automatic savings to meet your savings goal...', 
    time: '17:00 - April 24',),
];

List<NotificationData> yesterdayNotifications = [
  NotificationData(
    icon: Icons.currency_exchange, 
    title: 'Transactions!', 
    contents: 'Set up your automatic savings to meet your savings goal...', 
    time: '17:00 - April 24',),
    NotificationData(
    icon: Icons.notifications_outlined, 
    title: 'Reminder!', 
    contents: 'Set up your automatic savings to meet your savings goal...', 
    time: '17:00 - April 24',),
];

List<NotificationData> weekNotifications = [
  NotificationData(
    icon: Icons.money, 
    title: 'Expense record!', 
    contents: 'Set up your automatic savings to meet your savings goal...', 
    time: '17:00 - April 24',),
    NotificationData(
    icon: Icons.currency_exchange, 
    title: 'Transactions', 
    contents: 'Set up your automatic savings to meet your savings goal...', 
    time: '17:00 - April 24',),
];

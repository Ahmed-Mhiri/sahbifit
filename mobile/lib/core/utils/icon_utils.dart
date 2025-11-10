import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconUtils {
  // Session Type Icons
  static IconData get groupSessionIcon => FontAwesomeIcons.users;
  static IconData get oneOnOneSessionIcon => FontAwesomeIcons.user;
  static IconData get sessionIcon => FontAwesomeIcons.dumbbell;
  
  // Navigation Icons
  static IconData get homeIcon => FontAwesomeIcons.house;
  static IconData get mySessionsIcon => FontAwesomeIcons.calendar;
  static IconData get postSessionIcon => FontAwesomeIcons.plus;
  static IconData get chatIcon => FontAwesomeIcons.message;
  static IconData get profileIcon => FontAwesomeIcons.user;
  
  // Status & Verification Icons
  static IconData get verifiedBadge => OctIcons.verified;
  static IconData get lockIcon => FontAwesomeIcons.lock;
  static IconData get unlockIcon => FontAwesomeIcons.lockOpen;
  static IconData get warningIcon => FontAwesomeIcons.triangleExclamation;
  static IconData get successIcon => FontAwesomeIcons.circleCheck;
  static IconData get errorIcon => FontAwesomeIcons.circleXmark;
  
  // Action Icons
  static IconData get joinIcon => FontAwesomeIcons.rightToBracket;
  static IconData get editIcon => FontAwesomeIcons.penToSquare;
  static IconData get deleteIcon => FontAwesomeIcons.trash;
  static IconData get shareIcon => FontAwesomeIcons.share;
  static IconData get filterIcon => FontAwesomeIcons.filter;
  static IconData get searchIcon => FontAwesomeIcons.magnifyingGlass;
  static IconData get locationIcon => FontAwesomeIcons.locationDot;
  static IconData get timeIcon => FontAwesomeIcons.clock;
  
  // User & Profile Icons
  static IconData get settingsIcon => FontAwesomeIcons.gear;
  static IconData get logoutIcon => FontAwesomeIcons.rightFromBracket;
  static IconData get visibilityIcon => FontAwesomeIcons.eye;
  static IconData get blockUserIcon => FontAwesomeIcons.userSlash;
  
  // Chat Icons
  static IconData get sendMessageIcon => FontAwesomeIcons.paperPlane;
  static IconData get attachmentIcon => FontAwesomeIcons.paperclip;
  
  // Gym & Location Icons
  static IconData get gymIcon => FontAwesomeIcons.dumbbell;
  static IconData get mapIcon => FontAwesomeIcons.mapLocationDot;
  
  // Rating & Feedback
  static IconData get starIcon => FontAwesomeIcons.star;
  static IconData get starHalfIcon => FontAwesomeIcons.starHalfStroke;
  static IconData get starOutlineIcon => FontAwesomeIcons.star;
  static IconData get reportIcon => FontAwesomeIcons.flag;
  
  // Utility Method - Only icon selection remains here
  static IconData getSessionTypeIcon(bool isGroupSession) {
    return isGroupSession ? groupSessionIcon : oneOnOneSessionIcon;
  }
}
// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "appName": "Paint",
  "skip": "Skip",
  "logout": "Logout",
  "cancel": "Cancel",
  "save": "Save",
  "saveAll": "Save all",
  "left": "Stay",
  "yes": "Yes",
  "no": "No",
  "camera": "Camera",
  "gallery": "Gallery",
  "error": "Error",
  "unhadledError": "Unhandled error",
  "selectColor": "Select brush color",
  "accept": "Accept",
  "authReason": "This will make it easier to unlock the app",
  "setPassword": "Set a password for the security of your data",
  "enterPassword": "Enter your password to log in to the app",
  "wrongPassword": "Invalid password",
  "chooseImageSource": "Choose from where to choose an image",
  "saveSuccess": "Successfully saved",
  "beforeAfter": "Before/After",
  "nice": "Nice!",
  "rollBack": "Undo the last one drawn",
  "rollForward": "Return the canceled drawn",
  "addPicture": "Add Photo",
  "rollBackFilters": "Cancel filter actions (ignores the drawing)"
};
static const Map<String,dynamic> ru = {
  "appName": "Paint",
  "skip": "Пропустить",
  "logout": "Выйти из приложения",
  "cancel": "Отмена",
  "save": "Сохранить",
  "saveAll": "Сохранить все",
  "left": "Остаться",
  "yes": "Да",
  "no": "Нет",
  "camera": "Камера",
  "gallery": "Галлерея",
  "error": "Ошибка",
  "unhadledError": "Необработанное исключение",
  "selectColor": "Выбрать цвет кисти",
  "accept": "Применить",
  "authReason": "Так будет проще разблокировать приложение",
  "setPassword": "Установите пароль для безопасности ваших данных",
  "enterPassword": "Введите пароль чтобы войти в приложение",
  "wrongPassword": "Неверный пароль",
  "chooseImageSource": "Выберите откуда выбрать изображение",
  "saveSuccess": "Успешно сохраненно",
  "beforeAfter": "До/После",
  "nice": "Супер!",
  "rollBack": "Отменить последнее нарисованное",
  "rollForward": "Вернуть отмененное нарисованное",
  "addPicture": "Добавить фото",
  "rollBackFilters": "Отменить действия фильтров(игнорирует рисунок)"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}

// ignore_for_file: prefer_single_quotes

import 'dart:io';
import 'package:change_case/change_case.dart';
import 'package:icon_font_generator/icon_font_generator.dart';

Map<String, String> readFiles() {
  Directory dir = Directory('./assets/icons');

  Map<String, String> svgMap = <String, String>{};
  dir
      .listSync()
      .where((FileSystemEntity element) => element.path.endsWith('.svg'))
      .forEach((FileSystemEntity element) {
    File file = File(element.path);

    String svg = file.readAsStringSync();
    String name = element.path.split('/').last.split('.').first;
    svgMap.addEntries(
      <MapEntry<String, String>>[
        MapEntry<String, String>(name.toCamelCase(), svg),
      ],
    );
  });

  return svgMap;
}

String getMapIcons(Map<String, String> svgMap) {
  String mapIcons = '';

  svgMap.forEach(
    (String key, String value) => mapIcons += "'$key': EstrellasIcons.$key,",
  );
  return mapIcons;
}

void main() {
  String basePath = './lib';
  String packageFontPath = '$basePath/font/estrellas_font.otf';
  String packageFilePath = '$basePath/icons_font.dart';
  String exampleFontPath = './example/assets/fonts/icons/estrellas_font.otf';

  Map<String, String> svgMap = readFiles();

  // Input data

  // Generating font
  SvgToOtfResult svgToOtfResult = svgToOtf(
    svgMap: svgMap,
    fontName: 'EstrellasIcons',
  );

  // Writing font to a file
  writeToFile(packageFontPath, svgToOtfResult.font);
  writeToFile(exampleFontPath, svgToOtfResult.font);

  // Generating Flutter class

  String generatedClass = generateFlutterClass(
    glyphList: svgToOtfResult.glyphList,
    familyName: svgToOtfResult.font.familyName,
    className: 'EstrellasIcons',
    fontFileName: packageFontPath,
  );

  String generatedFile = """
  $generatedClass
  
  Map<String,IconData> iconsMap = {${getMapIcons(svgMap)}};
  """;

  // Writing class content to a file
  File(packageFilePath).writeAsStringSync(generatedFile);
}

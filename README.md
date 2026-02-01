# Icons Font

Create a font with all \*.svg icons in the folder `assets/icons`
This tool use the package: [Icon Font Generator](https://pub.dev/packages/icon_font_generator)

###Requirements:

- Node.JS v11+
- Icons extension \*.svg
- Icons name in [snake_case](https://en.wikipedia.org/wiki/Snake_case)

###Steps:

1. Install the package, (`Pub` should already added in the PATH environment variable)

   `pub global activate icon_font_generator`

   or

   `dart pub global activate icon_font_generator`

2. Ensure that the `assets/icons/` path contain all the `*.svg` that you want convert to the font.
3. Run this command:
   ```
   dart pub global run icon_font_generator:generator assets/icons lib/font/croatiapp_font.otf --output-class-file=lib/icons_font.dart --class-name=CroatiappIcons
   ```
4. Enjoy

# Arizona Icons

## Using the Icons
The icons can be used with Arizona Digital CDN link:

https://cdn.digital.arizona.edu/lib/az-icons/main/az-icons-styles.css


## Icon Creation Process
The icons were designed using vector design software, and the font files were generated using the [IcoMoon App](https://icomoon.io/app).

Before generating the font, the imported files must be properly processed first as *compound path* SVG files on the same sized, square artbord. Strokes in the SVG files will be ignored when IcoMoon generates the files and must be converted to fills and/or compound paths before importing. Once each icon is saved as its own SVG file, they can be imported to IcoMoon and mapped to Unicode's Private Use Area (PUA) code points. This means the glyphs will not be associated with any letters or characters which may be otherwise used symantically.

When new icons need to be added or contributed, care must be taken not to change or duplicate the PUA codes connected with each icon (i.e., the icon class `.az-icon-award` is currently mapped to the PUA code `e901`). When new icons are introduced, the entire font needs to be re-generated with the IcoMoon App and the original PUA codes matched to their corresponding icons (the newly introduced icon will have a new PUA code specified).

Note the default stylesheet provided by IcoMoon has been altered to enhance usage. The only thing which should change in the CSS is the addition of the new icon class declaration. Also note that the font files generated should have the name "az-icons". This can be set when generating the files through the IcoMoon App.
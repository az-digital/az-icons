# Arizona Icons

## Using the Icons
The icons can be used with Arizona Digital CDN link:

https://cdn.digital.arizona.edu/lib/az-icons/main/az-icons-styles.css

_(Latest vs. Pinned release information coming soon)_

## Icon Creation and Generation Process
The icons were designed using vector design software, and the font files were generated using the [IcoMoon App](https://icomoon.io/app).


### Preparing the Graphics
Before generating the font in IcoMoon, the imported files must be properly processed first:

- [ ] Use the same sized, square artbord
- [ ] Make sure each graphic is a _compound path_ or fill (particularly complex graphics will need to be a single compound path)\*
- [ ] Save each icon independently as an SVG file

\*Strokes in the SVG files will be ignored when IcoMoon generates the files and must be converted to fills and/or compound paths before importing. 

### Generating the Font
Once each icon is saved as its own SVG file, they can be imported to IcoMoon and mapped to [Unicode's Private Use Area (PUA)](https://en.wikipedia.org/wiki/Private_Use_Areas) code points. This means the glyphs will not be associated with any letters or characters which may be otherwise used symantically.

When new icons are added the font files will need to be regenerated:

- [ ] Make sure to name the font **az-icons** before it's generated (this can be set before generating the files through the IcoMoon App)
- [ ] The original PUA codes need to be matched to their corresponding icons in IcoMoon (a newly introduced icon will need an unused PUA code specified).
- [ ] Do _not_ change or duplicate the PUA codes connected with each existing icon (i.e., the icon class `.az-icon-award` is currently mapped to the PUA code `e901`).
- [ ] Do not use the automatically generated CSS file from IcoMoon, instead only add the new icon class declaration (the default stylesheet provided by IcoMoon has been altered to enhance usage).
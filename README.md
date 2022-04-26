# Arizona Icons
Find more detailed information on how to use `az-icons` within the [Arizona
Bootstrap Docs](https://digital.arizona.edu/arizona-bootstrap/docs/2.0/icons/).
## Download
Download Arizona Icons to get the compiled CSS and font files, source code, or
include it with your favorite package managers like npm, RubyGems, and more.

### Source Files
Compile Arizona Icons with your own asset pipeline by downloading our source
CSS, SVG, PNG, and font files. This option requires some additional tooling:

### Arizona Digital CDN
Skip the download with the Arizona Digital CDN to deliver a cached version of
Arizona Icons’s CSS and font files to your project.

When choosing which version to include in your project, take these three choices
into account:

**Stable** version: Each tagged release has a permanent CDN link. This version
has to be upgraded on your project manually.
```
<link rel="stylesheet" href="https://cdn.digital.arizona.edu/lib/az-icons/1.0.0/az-icons-styles.css" crossorigin="anonymous">
```

**Latest** tagged version: The contents of this CDN link update automatically
every time we tag a release of `az-icons`. While there is some risk involved
with this link (for example, the icons could randomly break on your site), the
up-side is that you get access to new icons and upgrades to performance on each
release automatically. It's safe to use on production sites. Please
[report bugs to the AZ Digital team](https://github.com/az-digital/az-icons/issues/new?assignees=&labels=&template=bug_report.md).
```
<link rel="stylesheet" href="https://cdn.digital.arizona.edu/lib/az-icons/latest/az-icons-styles.css" crossorigin="anonymous">
```

**Main** version: Latest dev version. This is the tip of the main branch of
AZ Icons. Please do not use on production unless you are following the AZ
Icons project closely. Please [report bugs to the AZ Digital team](https://github.com/az-digital/az-icons/issues/new?assignees=&labels=&template=bug_report.md).
```
<link rel="stylesheet" href="https://cdn.digital.arizona.edu/lib/az-icons/main/az-icons-styles.css" crossorigin="anonymous">
```

### Package Managers
Pull the Arizona Icons source files into nearly any project with some of
the most popular package managers.

**npm**
Install Arizona Icons in your Node.js powered apps with npm:
```
npm install https://github.com/az-digital/az-icons
```

Install Arizona Icons in your Node.js powered apps with the yarn package:
```
yarn add https://github.com/az-digital/az-icons
```

## Contributing
### Icon Creation and Generation Process
The icons were designed using vector design software, and the font files were
generated using the [IcoMoon App](https://icomoon.io/app).

### Preparing the Graphics
Before generating the font in IcoMoon, the imported files must be properly
processed first:
- [ ] Use the same sized, square artboard
- [ ] Make sure each graphic is a *compound path* or fill (particularly complex
  graphics will need to be a single compound path)\*
- [ ] Save each icon independently as an SVG file

\* *Strokes in the SVG files will be ignored when IcoMoon generates the files
and must be converted to fills and/or compound paths before importing.*

### Generating the Font
Once each icon is saved as its own SVG file, they can be imported to IcoMoon and
mapped to [Unicode's Private Use Area
(PUA)](https://en.wikipedia.org/wiki/Private_Use_Areas) code points. This means
the glyphs will not be associated with any letters or characters which may be
otherwise used semantically.

When new icons are added the font files will need to be regenerated:

- [ ] The original PUA codes need to be matched to their corresponding icons in
  IcoMoon (a newly introduced icon will need an unused PUA code specified).
- [ ] Do _not_ change or duplicate the PUA codes connected with each existing
  icon (i.e., the icon class `.az-icon-award` is currently mapped to the PUA
  code `e901`).
- [ ] Make sure to name the font **az-icons** before clicking IcoMoon App's font
  download button (the name can be set by clicking the small gear icon next to
  the download button first).
- [ ] Do not use the automatically generated CSS file from IcoMoon, instead only
  add the new icon class declaration (the default stylesheet provided by IcoMoon
  has been altered to enhance usage).

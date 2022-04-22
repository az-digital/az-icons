# Contributing

Want to contribute? Any release of Arizona Icons is tested and ready to use, but
additions to the set are in everyone's best interest.

If you want to get involved, you can:

- Request access to join the discussion on Slack ([learn
  more]((digital.arizona.edu/arizona-bootstrap/main/docs/0.0/about/get-involved))
- Participate in Friday meetings and Wednesday pull request review sessions (ask
  for more details in Slack)
- Submit pull requests on GitHub

Questions, bug reports or suggestions can also be emailed to
[uadigital@email.arizona.edu](mailto:uadigital@email.arizona.edu) or
(preferably!) reported on Slack.

## Icon Creation and Generation Process
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
otherwise used symantically.


When new icons are added the font files will need to be regenerated:

- [ ] The original PUA codes need to be matched to their corresponding icons in
  IcoMoon (a newly introduced icon will need an unused PUA code specified).
- [ ] Do _not_ change or duplicate the PUA codes connected with each existing
  icon (i.e., the icon class `.az-icon-award` is currently mapped to the PUA
  code `e901`).
- [ ] Make sure to name the font **az-icons** before clicking IcoMoon App's font
  download button (the name can be set by clicking the small gear icon next to
  the download button first)
- [ ] Do not use the automatically generated CSS file from IcoMoon, instead only
  add the new icon class declaration (the default stylesheet provided by IcoMoon
  has been altered to enhance usage).

### Getting your change ready for a pull request.
Add your new files to this repository in the following structure.

```
az-icons
├── demo.html
└── src
    ├── az-icons-styles.css
    ├── fonts
    │   ├── az-icons.eot
    │   ├── az-icons.svg
    │   ├── az-icons.ttf
    │   └── az-icons.woff
    ├── png
    │   └── *.png
    └── svg
        └── *.svg
```

Then you should be able to use npm to prepare the new files for distribution.

First install the package dependencies

```
npm install
```

Next use the automated preparation tools to recreate the dist folder.

```
npm run dist
```

See the [package.json](./package.json) for all of the available commands.

## Pull Request Process
1. Create an issue on GitHub with the appropriate [issue type template](https://github.com/az-digital/az-icons/issues/new/choose).
2. Create a branch on the az-icons repository using the issue type naming convention of `<issue-type>/<issue-number>`. Example: `feature/123` or `bug/123`.
3. Make and commit your changes.
4. Create a pull request to be reviewed by the Arizona Digital community. Be sure to include a reference to the issue in your pull request description. Read more about [linking a pull request to an issue](https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue).

## Policies
Contributions to Arizona Bootstrap must adhere to Arizona Digital's policies and [Code of Conduct](https://github.com/az-digital/policies/blob/main/code-of-conduct.md).

- [Arizona Digital merging policies](https://github.com/az-digital/policies/blob/main/code-of-conduct.md)
- [Arizona Digital Code of Conduct](https://github.com/az-digital/policies/blob/main/code-of-conduct.md)
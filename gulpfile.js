'use strict';

const { series, src, dest, gulp } = require('gulp');
const cleanCSS = require('gulp-clean-css'); // Minify CSS.
const del = require('del'); // Deletes files/folders.
const iconfont = require('gulp-iconfont'); // Creates icon fonts.
const iconfontCss = require('gulp-iconfont-css'); // Creates icon font CSS files.
const rename = require('gulp-rename'); // Rename files.
const runSequence = require('run-sequence'); // Run Gulp tasks in order.
const runTimestamp = Math.round(Date.now()/1000);
const svg2png = require('gulp-svg2png'); // Convert SVG to PNG.
const svgmin = require('gulp-svgmin'); // Minify SVG.
const fontName = 'az-icons-symbols'; // Font config.

// Clean output directory.
function clean() {
    return del(['dist/*']);
}

// Gulp task to convert SVG images to font files.
function svgtofont() {
    return src('./src/svg/*.svg') // Source folder containing the SVG images.
        .pipe(iconfontCss({
                          firstGlyph: 0xE600,
                          fontName: fontName, // The name that the generated font will have.
                          path: 'templates/az-icons-template.css', // The path to the template that will be used to create the CSS file.
                          targetPath: 'az-icons.css', // The path where the final CSS file will be generated.
                          fontPath: './', // The path to the icon font file.
                          cssClass: 'az-' // Prefix for the icon class names.
        }))
        .pipe(iconfont({
                       startUnicode: 0xE600,
                       prependUnicode: true,
                       fontName: fontName, // Name of the font.
                       formats: ['ttf', 'eot', 'woff', 'woff2', 'svg'], // The font file formats that will be created.
                       normalize: true,
                       timestamp: runTimestamp // Recommended to get consistent builds when watching files.
        }))
        .pipe(dest('./dist/'));
}

// Gulp task to minify CSS files.
function minifycss() {
    return src('dist/az-icons.css') // Make expanded CSS version ready for distribution.
        .pipe(dest('dist/'))
        .pipe(cleanCSS()) // Minify the file.
        .pipe(rename({ extname: '.min.css' })) // Add .min.css to the end of the minified file.
        .pipe(dest('dist/')); // Outputs the .min.css file.
}

// Gulp task to minify SVG files.
function minifysvg() {
    return src('src/svg/*.svg')
        .pipe(svgmin()) // Minify the SVG files.
        .pipe(rename({ extname: '.min.svg' })) // Add .min.svg to the end of the minified file.
        .pipe(dest('dist/svg')); // Outputs the .min.svg file.
}

// Gulp task to convert SVG files to PNG.
function svgtopng() {
    return src('src/svg/*.svg') // SVG source files to be converted.
        .pipe(svg2png()) // Converts the SVG files.
        .pipe(dest('dist/png')); // Outputs the PNG files.
}

// Gulp will run the tasks in this order.
exports.clean = clean;
exports.default = series(svgtofont, minifycss, svgtopng, minifysvg);


#!/bin/bash

# Concatenate JS files
# 1. Component handler
# 2. Polyfills
# 3-15. Base Components
# 16-17. Complex Components
# 18. Ripple
cat src/mdlComponentHandler.js \
src/third_party/**/*.js \
src/button/button.js \
src/checkbox/checkbox.js \
src/icon-toggle/icon-toggle.js \
src/menu/menu.js \
src/progress/progress.js \
src/radio/radio.js \
src/slider/slider.js \
src/snackbar/snackbar.js \
src/spinner/spinner.js \
src/switch/switch.js \
src/tabs/tabs.js \
src/textfield/textfield.js \
src/tooltip/tooltip.js \
src/layout/layout.js \
src/data-table/data-table.js \
src/ripple/ripple.js > dist/material.js

# Minify with esbuild
bunx esbuild dist/material.js --minify-whitespace --minify-identifiers --outfile=dist/material.min.js

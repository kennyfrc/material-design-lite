module.exports = {
  plugins: [
    require('postcss-url')({
      url: 'inline',
      basePath: './src'
    })
  ],
};

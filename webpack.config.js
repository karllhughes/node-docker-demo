const path = require('path');

module.exports = {
  entry: './src/entry.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public')
  },
  watchOptions: {
    ignored: path.resolve(__dirname, 'node_modules'),
    poll: true
  },
  module: {
    rules: [
      {
        test: /\.(scss)$/,
        use: [{
          loader: "style-loader"
        }, {
          loader: "css-loader"
        }, {
          loader: "sass-loader"
        }]
      },
    ]
  }
};

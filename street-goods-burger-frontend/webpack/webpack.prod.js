const path = require('path'); /* node path */
const MinicssExtractPlugin = require('mini-css-extract-plugin'); /* extracting css from js*/
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

module.exports = {
  mode: 'production',
  devtool: 'source-map',

  entry: {
    app: './src/index.tsx'
  },

  output: {
    filename: '[name][contenthash].bundle.js',
    path: path.resolve(__dirname, '../dist/prod')
  },

  module: {
    rules: [
      // load css
      {
        // sass or scss
        test: /\.s[ac]ss$/i,
        use: [
          MinicssExtractPlugin.loader,
          'css-loader',
          {
            loader: 'postcss-loader',
            options: {
              postcssOptions: {
                plugins: [['postcss-preset-env', 'autoprefixer']]
              }
            }
          },
          'sass-loader'
        ]
      }
    ]
  },

  optimization: {
    minimizer: [new CssMinimizerPlugin(), '...']
  },

  plugins: [
    // // css extractor from js
    new MinicssExtractPlugin({
      filename: '[name].bundle.css'
    })
  ]
};

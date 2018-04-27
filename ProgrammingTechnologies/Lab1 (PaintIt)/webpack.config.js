const ExtractTextPlugin = require('extract-text-webpack-plugin');
require.extensions['.scss'] = () => { return; }; require.extensions['.css'] = () => { return; };

module.exports = {
    watch: true,
    target: 'electron',
    entry: './app/src/entry.js',
    output: {
        path: __dirname + '/app/build',
        publicPath: 'build/',
        filename: 'bundle.js'
    },

    module: {
        rules: [
            {
                test: /\.jsx?$/,
                loader: 'babel-loader',
                options: {
                    presets: ['react']
                }
            },
            {
                test: /\.css$/,
                use: 'css-loader'
            },
            {
                test: /\.scss$/,
                loader: 'style-loader!css-loader!sass-loader'
            },
            {
                test: /\.(png|jpg|gif|svg)$/,
                use: 'file-loader'
            },
            {
              test: /\.ttf$/,
              use: [
                {
                  loader: 'ttf-loader',
                  options: {
                    name: './font/[hash].[ext]',
                  },
                },
              ]
          }

        ]
    },

    plugins: [
        new ExtractTextPlugin({
            filename: 'bundle.css',
            disable: false,
            allChunks: true
        }
    )
]
}

module: {
  loaders: [
    { test: /\.[ot]tf$/, loader: 'url?limit=65000&mimetype=application/octet-stream&name=public/fonts/[name].[ext]' }
  ]
}

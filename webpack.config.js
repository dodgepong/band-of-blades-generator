const webpack = require('webpack');
const path = require('path');
const nodeDir = __dirname + '/node_modules';
const elmSource = __dirname + '/elm';
const staticDir = __dirname + '/bob/static';
// const ExtractTextPlugin = require('extract-text-webpack-plugin');
// const UglifyJsPlugin = require('uglifyjs-webpack-plugin');


// const extractSASS = new ExtractTextPlugin('styles.css');

const TARGET_ENV = process.env.npm_lifecycle_event === 'build:prod' ? 'production' : 'development';

const config = (env, argv) => ({
    entry: {
        app: './bob/static/js/app.js'
    },
    resolve: {
        modules: [
            path.join(__dirname, 'elm/src'),
            'node_modules'
        ],
        extensions: ['.js', '.elm']
    },
    output: {
        path: staticDir + '/dist',
        publicPath: '/static/dist/'
    },
    module: {
        rules: [
            {
                test: /\.elm$/,
                exclude: [/elm-stuff/, /node_modules/],
                use: {
                    loader: 'elm-webpack-loader',
                    options: {
                        debug: argv.mode === 'development',
                        optimize: argv.mode !== 'development',
                        cwd: elmSource
                    }
                }
            },
            { test: /\.css$/, use: ['style-loader', 'css-loader'] },
            // {
            //     test: /\.scss$/,
            //     use: extractSASS.extract({
            //         fallback: 'style-loader',
            //         use: [
            //             { loader: 'css-loader' },
            //             { loader: 'sass-loader', options: { includePaths: [ nodeDir ] } }
            //         ]
            //     })
            // },
            { test: /\.woff(2)?(\?v=\d+\.\d+\.\d+)?$/, loader: 'url-loader', options: { limit: 10000, mimetype: 'application/font-woff' } },
            { test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, loader: 'url-loader', options: { limit: 100000, minetype: 'application/octet-stream' } },
            { test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, loader: 'file-loader' },
            { test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, loader: 'url-loader', options: { limit: 100000, minetype: 'image/svg+xml' } }
        ]
    },
    // plugins: [
    //     extractSASS
    // ],
    optimization: {
        minimize: TARGET_ENV === 'production'
    }
});

module.exports = config;
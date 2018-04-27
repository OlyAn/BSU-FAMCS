// Basic init
const electron = require('electron');
const { default: installExtension, REACT_DEVELOPER_TOOLS } = require('electron-devtools-installer');

const { app, BrowserWindow } = electron;

// Let electron reloads by itself when webpack watches changes in ./app/
require('electron-reload')(__dirname);

// To avoid being garbage collected
let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    x: 150,
    y: 0,
    width: 1350,
    height: 820,
    icon: './app/src/assets/paint.png',
    resizable: false,
  });
  mainWindow.loadURL(`file://${__dirname}/app/index.html`);
  installExtension(REACT_DEVELOPER_TOOLS);
}

app.on('ready', createWindow);

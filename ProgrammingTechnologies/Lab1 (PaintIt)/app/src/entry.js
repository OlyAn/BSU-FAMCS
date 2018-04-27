import React from 'react';
import { render } from 'react-dom';
import DrawingArea from './DrawingArea.jsx';
require('./styles/global.css');

render(
  <DrawingArea/>, document.getElementById('drawing-area')
)

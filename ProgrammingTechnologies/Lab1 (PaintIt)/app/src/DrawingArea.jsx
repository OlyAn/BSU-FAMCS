import React, { Component } from 'react'; // eslint-disable-line no-unused-vars
import { render } from 'react-dom'; // eslint-disable-line no-unused-vars
import AmaticBold from './styles/fonts/Amatic-Bold.ttf';
import * as helpers from './helpers';

export default class DrawingArea extends Component {
  constructor(props) {
    super(props);
    this.borderColor = '#000000';
    this.options = { backgroundColor: '#000000' };
    this.state = {
      points: [],
      chosenShape: 'NoShapeSelected',
      showNumberOfSides: false,
    };
  }

  componentDidMount() {
    this.canvas = document.getElementById('custom-canvas');
    this.context = this.canvas.getContext('2d');
    this.rect = this.canvas.getBoundingClientRect();
    const buttons = document.getElementsByClassName('bucket-icon');
    [].forEach.call(buttons, (i) => {
      i.setAttribute('uk-icon', 'icon: paint-bucket');
    });
  }

  addPoint(e) {
    this.setState({
      points: [...this.state.points, {
        x: e.clientX - this.rect.left,
        y: e.clientY - this.rect.top,
      }],
    });
  }

  handleInputChange() {
    this.borderColor = this.brdColor.value;
    this.options.backgroundColor = this.bckgrColor.value;
    this.options.numberOfSides =
      (this.state.showNumberOfSides === true) ? this.numberOfSides.value : null;
  }

  draw(shape, event) {
    switch (this.state.chosenShape) {
      case 'Line':
      case 'Ray':
      case 'LineSegment':
        this.options.startPoint = this.state.points[0];
        this.options.endPoint = this.state.points[1];
        break;
      case 'PolygonalChain':
        this.options.points = this.state.points;
        break;
      case 'Ellipse':
        this.options.secondPoint = this.state.points[2];
      case 'Circle':
        this.options.center = this.state.points[0];
        this.options.firstPoint = this.state.points[1];
        break;
      case 'IrregularPolygon':
        this.options.points = this.state.points;
        break;
      case 'RegularPolygon':
        this.options.center = this.state.points[0];
        this.options.radius = Math.sqrt((this.options.center.x - this.state.points[1].x) ** 2 +
          (this.options.center.y - this.state.points[1].y) ** 2);
        this.options.points = [];
        break;
      case 'NoShapeSelected':
        return;
    }
    const shapeObject = helpers.callConstructor(shape, this.borderColor, this.options);
    shapeObject.draw(this.context, this.canvas);
    this.setState({
      points: [],
    });
  }

  clearCanvas() {
    this.context.clearRect(0, 0, this.canvas.width, this.canvas.height);
  }

  showNumberOfSidesInput() {
    if (this.state.showNumberOfSides) {
      return (
        <div className="uk-width-1-2">
          <label className='uk-form-label uk-margin-left'>SIDES:</label>
          <div className='uk-inline uk-margin-small-left uk-margin-small-right uk-width-1-3' id='numberOfSides'>
            <input id="sidesNumber"
                type="number"
                className="uk-input"
                min="3"
                onChange={this.handleInputChange.bind(this)}
                ref={ (input) => { this.numberOfSides = input; } }/>
          </div>
        </div>
      );
    }
    return null;
  }

  chooseShape(shape, event) {
    try {
      document.getElementById(this.state.chosenShape).style.backgroundColor = '';
    } catch (err) {}
    this.setState({
      chosenShape: shape,
    });
    if (shape === 'RegularPolygon') {
      this.setState({ showNumberOfSides: true });
    } else {
      this.setState({ showNumberOfSides: false });
    }
    document.getElementById(shape).style.backgroundColor = '#c0dedc';
  }

  render() {
    return (
      <div>
        <div className='main-header' style={{
            fontFamily: AmaticBold,
            fontSize: '7em',
            color: '#a51f3d',
            textShadow: '5px 4px 0px #f2bbbb',
            wordSpacing: '15px',
          }}>
          Paint it!
        </div>
        <div className="uk-alert custom-alert uk-width-2-3 uk-alert-warning" data-uk-alert>
          <span className="flash-icon uk-icon-large uk-form-icon uk-width-1-6" style={{ color: '#095550' }}/>
          { helpers.flash(this.state.chosenShape)}
        </div>
        <div className='uk-margin-remove-bottom uk-align-center'>
          <div className="uk-margin-small-bottom">
            <button className='uk-button uk-button-default' id='Line' onClick={ this.chooseShape.bind(this, 'Line') }>Line</button>
            <button className='uk-button uk-button-default' id='Ray' onClick={ this.chooseShape.bind(this, 'Ray') }>Ray</button>
            <button className='uk-button uk-button-default' id='LineSegment' onClick={ this.chooseShape.bind(this, 'LineSegment') }>Line Segment</button>
            <button className='uk-button uk-button-default' id='PolygonalChain' onClick={ this.chooseShape.bind(this, 'PolygonalChain') }>Polygonal Chain</button>
            <button className='uk-button uk-button-default' id='Circle' onClick={ this.chooseShape.bind(this, 'Circle') }>Circle</button>
            <button className='uk-button uk-button-default' id='Ellipse' onClick={ this.chooseShape.bind(this, 'Ellipse') }>Ellipse</button>
            <button className='uk-button uk-button-default' id='IrregularPolygon' onClick={ this.chooseShape.bind(this, 'IrregularPolygon') }>Irregular Polygon</button>
            <button className='uk-button uk-button-default' id='RegularPolygon' onClick={ this.chooseShape.bind(this, 'RegularPolygon') }>Regular Polygon</button>
          </div>
          <div className="uk-flex uk-flex-between uk-width-2-3 uk-margin-small-bottom">
            <div className="uk-flex uk-width-2-3">
              <div className='uk-width-1-2'>
                <label className='uk-form-label uk-margin-left'>BORDER</label>
                <span className='bucket-icon uk-margin-small-right uk-margin-small-left'></span>
                <input className='uk-input uk-width-1-4'
                       name='border-color'
                       type='color'
                       id='border-color-value'
                       onChange={this.handleInputChange.bind(this)}
                       ref={ (input) => { this.brdColor = input; } }/>
              </div>
              <div className='uk-width-2-3'>
                <label className='uk-form-label uk-margin-left'>BACKGROUND</label>
                <span className='bucket-icon uk-margin-small-right uk-margin-small-left'></span>
                <input className='uk-input uk-width-1-5'
                       name='background-color'
                       type='color'
                       id='background-color-value'
                       onChange={this.handleInputChange.bind(this)}
                       ref={ (input) => { this.bckgrColor = input; } }/>
              </div>
              {this.showNumberOfSidesInput()}
          </div>
          <div className='uk-margin-small-left uk-margin-small-right'>
            <button className='uk-button uk-button-danger uk-float-right' onClick={ this.clearCanvas.bind(this) }>
                Clear area
            </button>
          </div>
          </div>
        </div>

        <canvas id='custom-canvas'
          width='800px'
          height='400px'
          onClick={ this.addPoint.bind(this) }
          ref={this.refCallback}
          onDoubleClick={ this.draw.bind(this, this.state.chosenShape)}
        />
      </div>
    );
  }
}

/**
* Generated On: 2018-2-28
* Class: OneDShape
*/

const Shape = require('./Shape').default;

export default class OneDShape extends Shape {
  constructor(borderColor, options) {
    super(borderColor);
    this.startPoint = options.startPoint;
    this.endPoint = options.endPoint;
  }

  get startPoint() {
    return this._startPoint;
  }

  set startPoint(startPoint) {
    this._startPoint = startPoint;
  }

  get endPoint() {
    return this._endPoint;
  }

  set endPoint(endPoint) {
    this._endPoint = endPoint;
  }
}

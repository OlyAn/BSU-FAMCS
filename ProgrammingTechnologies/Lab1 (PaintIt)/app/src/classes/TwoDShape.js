/**
* Generated On: 2018-2-28
* Class: TwoDShape
*/

const Shape = require('./Shape').default;

export default class TwoDShape extends Shape {
  constructor(borderColor, options) {
    super(borderColor);
    this.backgroundColor = options.backgroundColor;
    this.center = options.center;
  }

  get backgroundColor() {
    return this._backgroundColor;
  }

  set backgroundColor(backgroundColor) {
    this._backgroundColor = backgroundColor;
  }

  get center() {
    return this._center;
  }

  set center(center) {
    this._center = center;
  }
}

/**
* Generated On: 2018-2-28
* Class: Shape
*/

export default class Shape {
  constructor(borderColor) {
    this.borderColor = borderColor;
  }

  get borderColor() {
    return this._borderColor;
  }

  set borderColor(value) {
    this._borderColor = value;
  }

  draw() {
    throw new Error('Method draw must be implemented');
  }
}

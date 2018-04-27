/**
* Generated On: 2018-2-28
* Class: Ellipse
*/

const Circle = require('./Circle').default;

export default class Ellipse extends Circle {
  constructor(borderColor, options) {
    super(borderColor, options);
    this.secondPoint = options.secondPoint;
  }

  draw(context) {
    const radiusY = Math.sqrt((this.firstPoint.x - this.center.x) ** 2 +
      (this.firstPoint.y - this.center.y) ** 2);
    const radiusX = Math.sqrt((this.secondPoint.x - this.center.x) ** 2 +
      (this.secondPoint.y - this.center.y) ** 2);
    context.beginPath();
    context.ellipse(this.center.x, this.center.y, radiusX, radiusY, 0, 2 * Math.PI, 0, 2 * Math.PI);
    context.fillStyle = this.backgroundColor;
    context.strokeStyle = this.borderColor;
    context.lineWidth = 3;
    context.stroke();
    context.fill();
  }

  get secondPoint() {
    return this._secondPoint;
  }

  set secondPoint(secondPoint) {
    this._secondPoint = secondPoint;
  }
}

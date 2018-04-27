/**
* Generated On: 2018-2-28
* Class: Circle
*/

const TwoDShape = require('./TwoDShape').default;

export default class Circle extends TwoDShape {
  constructor(borderColor, options) {
    super(borderColor, options);
    this.firstPoint = options.firstPoint;
  }

  draw(context) {
    const radius = Math.sqrt((this.firstPoint.x - this.center.x) ** 2 +
      (this.firstPoint.y - this.center.y) ** 2);
    context.beginPath();
    context.arc(this.center.x, this.center.y, radius, 0, 2 * Math.PI);
    context.fillStyle = this.backgroundColor;
    context.strokeStyle = this.borderColor;
    context.lineWidth = 3;
    context.stroke();
    context.fill();
  }

  get firstPoint() {
    return this._firstPoint;
  }

  set firstPoint(firstPoint) {
    this._firstPoint = firstPoint;
  }
}

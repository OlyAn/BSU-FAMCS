/**
* Generated On: 2018-2-28
* Class: IrregularPolygon
*/

const TwoDShape = require('./TwoDShape').default;

export default class IrregularPolygon extends TwoDShape {
  constructor(borderColor, options) {
    super(borderColor, options);
    this.points = options.points;
  }

  draw(context) {
    context.beginPath();
    context.moveTo(
      this.points[0].x,
      this.points[0].y,
    );
    this.points.forEach((item) => {
      context.lineTo(
        item.x,
        item.y,
      );
    });
    context.closePath();
    context.strokeStyle = this.borderColor;
    context.fillStyle = this.backgroundColor;
    context.lineWidth = 3;
    context.stroke();
    context.fill();
  }

  get points() {
    return this._points;
  }

  set points(points) {
    this._points = points;
  }
}

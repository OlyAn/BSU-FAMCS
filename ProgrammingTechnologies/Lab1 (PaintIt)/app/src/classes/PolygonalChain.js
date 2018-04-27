/**
* Generated On: 2018-2-28
* Class: PolygonalChain
*/
import LineSegment from './LineSegment';

export default class PolygonalChain {
  constructor(borderColor, options) {
    this.borderColor = borderColor;
    this.lineSegments = [];
    options.points.reduce((previousValue, currentValue) => {
      this.lineSegments.push(new LineSegment(borderColor, {
        startPoint: previousValue,
        endPoint: currentValue,
      }));
      return currentValue;
    });
  }

  draw(context) {
    this.lineSegments.forEach((item) => { item.draw(context); });
  }

  get lineSegments() {
    return this._lineSegments;
  }

  set lineSegments(lineSegments) {
    this._lineSegments = lineSegments;
  }
}

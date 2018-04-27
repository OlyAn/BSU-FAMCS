import React, { Component } from 'react'; // eslint-disable-line no-unused-vars
import { render } from 'react-dom'; // eslint-disable-line no-unused-vars

export default class RegularPolygon extends Component {
  render() {
    return (
      <p className="uk-width-4-5 uk-margin-remove-top">
        To draw a regular polygon click twice on the panel.
        The first sets the center of the сircumscribed circle of the polygon.
        The second one should be a double click and sets the radius this circle.
        You can select border and background color.
      </p>
    );
  }

  componentDidMount() {
    this.props.didMount();
  }
}

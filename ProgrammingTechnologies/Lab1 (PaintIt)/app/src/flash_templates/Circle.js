import React, { Component } from 'react'; // eslint-disable-line no-unused-vars
import { render } from 'react-dom'; // eslint-disable-line no-unused-vars

export default class Circle extends Component {
  render() {
    return (
      <p className="uk-width-4-5 uk-margin-remove-top">
        To draw a circle click twice on the panel.
        The first click sets the center of the circle.
        The second one should be a double click and is used to calculate its radius.
        You can select border and background color.
      </p>
    );
  }

  componentDidMount() {
    this.props.didMount();
  }
}

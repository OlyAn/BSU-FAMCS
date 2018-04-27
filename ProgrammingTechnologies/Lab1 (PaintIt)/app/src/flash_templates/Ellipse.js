import React, { Component } from 'react'; // eslint-disable-line no-unused-vars
import { render } from 'react-dom'; // eslint-disable-line no-unused-vars

export default class Ellipse extends Component {
  render() {
    return (
      <p className="uk-width-4-5 uk-margin-remove-top">
        To draw an ellipse click twice on the panel.
        It sets the diagonal points of the circumscribed rectangle of the ellipse.
        Second one should be a double click.
        You can select border and background color.
      </p>
    );
  }

  componentDidMount() {
    this.props.didMount();
  }
}

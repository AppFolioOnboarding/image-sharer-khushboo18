import React, { Component } from 'react';

class Form extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      comments: '',
      success: false,
      feedbackSubmitted: false
    };
  }

  updateName = (e) => {
    this.setState({
      name: e.target.value
    });
  }

  updateComments = (e) => {
    this.setState({
      comments: e.target.value
    });
  }

  resetFields = () => {
    this.setState({
      name: '',
      comments: ''
    });
  }

  submitForm = () => {
    const feedback = {
      name: this.state.name,
      comments: this.state.comments
    };
    fetch('http://localhost:3000/api/feedbacks', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(feedback)
    }).then((response) => {
      this.resetFields();
      this.setState({
        feedbackSubmitted: true
      });
      if (response.statusText === 'OK') {
        this.setState({
          success: true
        });
      }
    }).catch((error) => {
      console.log(error);
      this.setState({
        success: false
      });
    });
  }

  render() {
    const name = this.state.name;
    const comments = this.state.comments;
    return (
      <div className="container">
        <form>
          <div className="form-group">
            <label htmlFor="name">Your Name:
              <input type="text" id="name" name="name" value={name} onChange={this.updateName} />
            </label>
          </div>
          <div className="form-group">
            <label htmlFor="comment">Comments:
              <textarea id="comment" name="comment" value={comments} onChange={this.updateComments} />
            </label>
          </div>
          <button className="btn btn-primary" type="button" onClick={this.submitForm}>Submit</button>
          { this.state.feedbackSubmitted && this.state.success &&
            <h5 className="alert alert-success">Thanks for your feedback!</h5>
          }
          { this.state.feedbackSubmitted && !this.state.success &&
            <h6 className="alert alert-danger">Unable to save feedback. Make sure to enter both the above fields.</h6>
          }
        </form>
      </div>
    );
  }
}

export default Form;

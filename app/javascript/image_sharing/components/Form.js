import React from 'react';

export default function Form() {
  return (
    <div className="container">
      <form>
        <div className="form-group">
          <label htmlFor="name">Your Name:
            <input type="text" id="name" name="name" />
          </label>
        </div>
        <div className="form-group">
          <label htmlFor="comment">Comments:
            <textarea id="comment" name="comment" />
          </label>
        </div>
        <input className="btn btn-primary" type="submit" value="Submit" />
      </form>
    </div>
  );
}

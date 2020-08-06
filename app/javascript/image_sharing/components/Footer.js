import React from 'react';

export default function Footer() {
  return (
    <div className="footer fixed-bottom">
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
      <p className="copyright text-center">Copyright: Appfolio Inc. Onboarding</p>
    </div>
  );
}

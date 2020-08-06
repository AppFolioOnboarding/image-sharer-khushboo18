import React from 'react'

export default function Footer(props) {
    return(
        <div className="footer fixed-bottom">
        <form>
          <div className="form-group">
            <label htmlFor="name">Your Name:</label>
            <input type="text" id="name" name="name" />
          </div>
          <div className="form-group">
            <label htmlFor="comment">Comments:</label>
            <textarea id="comment" name="comment" />
          </div>
          <input className="btn btn-primary" type="submit" value="Submit" />
        </form>
        <p className="copyright text-center">Copyright: Appfolio Inc. Onboarding</p>
      </div>
    )
}
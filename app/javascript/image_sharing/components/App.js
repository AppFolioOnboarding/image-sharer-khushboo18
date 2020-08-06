import React from 'react';
import Header from './Header';
import Form from './Form';
import Footer from './Footer';

export default function App() {
  return (
    <div>
      <Header title="Tell us what you think" />
      {/* Put your components here: Flash Message, Form, Footer */}
      <Form />
      <Footer />
    </div>
  );
}

/* TODO: Add Prop Types check*/

/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('should render the name field correctly', () => {
    const wrapper = mount(<Footer />);
    const nameLabel = wrapper.find('label[htmlFor="name"]');
    assert.strictEqual(nameLabel.text(), 'Your Name:');
    const nameField = wrapper.find('#name');
    assert.strictEqual(nameField.length, 1);
    assert.strictEqual(nameField.prop('type'), 'text');
    assert.strictEqual(nameField.prop('name'), 'name');
  });

  it('should render the comment field correctly', () => {
    const wrapper = mount(<Footer />);
    const commentsLabel = wrapper.find('label[htmlFor="comment"]');
    assert.strictEqual(commentsLabel.text(), 'Comments:');
    const commentsField = wrapper.find('#comment');
    assert.strictEqual(commentsField.length, 1);
    assert.strictEqual(commentsField.prop('name'), 'comment');
  });

  it('should render the submit button correctly', () => {
    const wrapper = mount(<Footer />);
    const button = wrapper.find('.btn');
    assert.strictEqual(button.props().value, 'Submit');
    assert.strictEqual(button.length, 1);
  });

  it('should render the copyright correctly', () => {
    const wrapper = mount(<Footer />);
    const copyright = wrapper.find('p');
    assert.strictEqual(copyright.text(), 'Copyright: Appfolio Inc. Onboarding');
  });
});

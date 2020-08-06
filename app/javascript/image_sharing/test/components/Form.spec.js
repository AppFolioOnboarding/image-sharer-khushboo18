/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import Form from '../../components/Form';

describe('<Form />', () => {
  it('should render the name field correctly', () => {
    const wrapper = mount(<Form />);
    const nameLabel = wrapper.find('label[htmlFor="name"]');
    assert.strictEqual(nameLabel.text(), 'Your Name:');
    const nameField = wrapper.find('#name');
    assert.strictEqual(nameField.length, 1);
    assert.strictEqual(nameField.prop('type'), 'text');
    assert.strictEqual(nameField.prop('name'), 'name');
  });

  it('should render the comment field correctly', () => {
    const wrapper = mount(<Form />);
    const commentsLabel = wrapper.find('label[htmlFor="comment"]');
    assert.strictEqual(commentsLabel.text(), 'Comments:');
    const commentsField = wrapper.find('#comment');
    assert.strictEqual(commentsField.length, 1);
    assert.strictEqual(commentsField.prop('name'), 'comment');
  });

  it('should render the submit button correctly', () => {
    const wrapper = mount(<Form />);
    const button = wrapper.find('.btn');
    assert.strictEqual(button.props().value, 'Submit');
    assert.strictEqual(button.length, 1);
  });
});

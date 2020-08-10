/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('should render the copyright correctly', () => {
    const wrapper = mount(<Footer />);
    const copyright = wrapper.find('p');
    assert.strictEqual(copyright.text(), 'Copyright: Appfolio Inc. Onboarding');
  });
});

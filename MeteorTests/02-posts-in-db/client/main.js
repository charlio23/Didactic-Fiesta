import { Template } from 'meteor/templating';
import { ReactiveVar } from 'meteor/reactive-var';
import { Posts } from '../imports/api/posts.js';

import './main.html';

Template.blogHome.helpers({
  posts() {
    return Posts.find({});
  },
});

Template.blogPost.helpers({
  id() {
  	return FlowRouter.getParam("postId");
  }
});
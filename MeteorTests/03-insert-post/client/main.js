import { Template } from 'meteor/templating';
import { ReactiveVar } from 'meteor/reactive-var';
import { Posts } from '../imports/api/posts.js';

import './main.html';

Template.blogHome.helpers({
  posts() {
    return Posts.find({});
  },
});

Template.blogHome.events({
	'submit .new-post'(event) {
		event.preventDefault();
		const target = event.target;
		const title = target.title.value;
		Posts.insert({
			title: title
		});
		target.title.value = '';
	}
})

Template.blogPost.helpers({
  id() {
  	return FlowRouter.getParam("postId");
  }
});
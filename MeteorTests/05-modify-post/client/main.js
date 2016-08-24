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
});

Template.blogPost.helpers({
  id() {
  	return FlowRouter.getParam("postId");
  },
  title() {
  	return Posts.findOne(FlowRouter.getParam("postId")).title;
  }
});

Template.blogPost.events({
	'click p.remove-post a.remove-post'(event) {
		Posts.remove($('#post-id').val());
	},
	'submit .post'(event) {
		event.preventDefault();
		// We cannot use this._id here because this is not a list of posts
		Posts.update($('#post-id').val(), {
			title: event.target.title.value
		});
	}
});
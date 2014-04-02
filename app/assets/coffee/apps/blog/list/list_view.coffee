@SampleApp.module "BlogApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Blog extends App.Views.ItemView
		template: "blog/list/test"
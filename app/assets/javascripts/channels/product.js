App.product = App.cable.subscriptions.create("ProductChannel", {
	connected: function() {
		// Called when the subscription is ready for use on the server
	},

	disconnected: function() {
		// Called when the subscription has been terminated by the server
	},

	received: function(data) {
		// Called when there's incoming data on the websocket for this channel
		console.log("received");
		console.log(data);
		$(".alert.alert-info.comment").show()
		$('#see-comments').prepend(data.comment);
		var commentId = ".comment-" + $("[data-comment-id]").data("comment-id");
		$('#see-comments').find(commentId).addClass("flash-highlight").removeClass("flash-highlight", 500)
		$('#see-comments').find(commentId).find('.comment-delete').hide();
		highlightComments();
		rated();
	},

	listen_to_comments: function() {
		return this.perform('listen', {
			product_id: $("[data-product-id]").data("product-id")
		});
	}
});

$(document).on('turbolinks:load', function() {
	App.product.listen_to_comments();
});

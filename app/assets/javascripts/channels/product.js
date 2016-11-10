App.product = App.cable.subscriptions.create("ProductChannel", {
	connected: function() {
		// Called when the subscription is ready for use on the server
		console.log("connected");
	},

	disconnected: function() {
		// Called when the subscription has been terminated by the server
	},

	received: function(data) {
		// Called when there's incoming data on the websocket for this channel
		//console.log("received");
		$(".alert.alert-info.comment").show();
		//$('.product-reviews').prepend(data.comment);
		//refreshRating();
	}

	//listen_to_comments: function() {
		//return this.perform('listen', {
			//product_id: $("[data-product-id]").data("product-id")
		//});
	}
});

//$(document).on('turbolinks:load', function() {
	//App.product.listen_to_comments();
	//console.log("hello world");
//});

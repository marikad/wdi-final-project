$(function(){
/**
 * jTinder initialization
 */
 $("#tinderslide").jTinder({
	// dislike callback
	onDislike: function (item) {
	    // set the status text
	    var url = item[0].innerHTML.split('href="')[1].split('"')[0]
	    $.ajax({
	    	method: "PUT",
	    	url: url+'/dislike'
	    }).done(function(data){
	    	$('#status').html('Dislike image ' + (item.index()+1));
	    })
	  },
	// like callback
	onLike: function (item) {
	    // set the status text
	    var url = item[0].innerHTML.split('href="')[1].split('"')[0]
	    console.log(url)
	    $.ajax({
	    	method: "PUT",
	    	url: "http://localhost:3000"+url+'/like'
	    }).done(function(data){
	    	$('#status').html('Like image ' + (item.index()+1));
	    })

	  },
	  animationRevertSpeed: 200,
	  animationSpeed: 400,
	  threshold: 1,
	  likeSelector: '.like',
	  dislikeSelector: '.dislike'
	});

/**
 * Set button action to trigger jTinder like & dislike.
 */
 $('.actions .like, .actions .dislike').click(function(e){
 	e.preventDefault();
 	$("#tinderslide").jTinder($(this).attr('class'));
 });

});
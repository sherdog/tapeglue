(function($){
	
	$.fn.toggleCheck = function( options ) {

		var defaults = {
			'toggle': 			'toggle',
			'toggleClass': 		'icon-checkbox-checked',
			'untoggleClass': 	'icon-checkbox-unchecked',
			'toggleWrap': 		'span',
			'extraClass': 		''
		};
		var options = $.extend(defaults, options);
		return this.each(function(i, obj){

			var o = options;

			var elements = $(obj);
			var parent = elements.parent();

			elements.hide();

			parent.prepend('<a href="#" class="'+o.toggle+'"><'+o.toggleWrap+' class="icons-dark '+o.untoggleClass+'"></'+o.toggleWrap+'></a>');

			$('.'+o.toggle).click(function(e){
				e.preventDefault();
				alert(e.target);
				var target = $(this).find(o.toggleWrap);
				alert(target.hasClass(o.toggleClass));
				if(target.hasClass(o.toggleClass)){;
					target.addClass(o.untoggleClass);
					target.removeClass(o.toggleClass);
				} else {
					target.addClass(o.toggleClass);
					target.removeClass(o.untoggleClass);
				}
			});
			

		});

	};

})(jQuery);
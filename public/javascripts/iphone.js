$.jQTouch({
        statusBar: 'black',
        icon: false,
        useFastTouch: true,
        useAnimations: true,
        preloadImages: [
            '/stylesheets/jqtouch/jqt/img/chevron.png',
            '/stylesheets/jqtouch/jqt/img/back_button.png',
            '/stylesheets/jqtouch/jqt/img/back_button_clicked.png',
            '/stylesheets/jqtouch/jqt/img/button.png',
            '/stylesheets/jqtouch/jqt/img/button_clicked.png',
            '/stylesheets/jqtouch/jqt/img/chevron_circle.png',
            '/stylesheets/jqtouch/jqt/img/toolbar.png'
            ]
    });
    
$(function() {
  $('ul.unread li.knot a[target="_blank"]').click(function(event) {
    var url = this.getAttribute('href');
    $(this).parent('li').detach().appendTo('#read ul.read').end();
    var newWindow = window.open(url, '_blank');
    if (newWindow) {
      if (newWindow.focus) {
        newWindow.focus();
      }
      return false;
    }
  });
  
});
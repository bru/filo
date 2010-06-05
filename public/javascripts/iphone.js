var jQT = new $.jQTouch({
        statusBar: 'black-translucent',
        icon: false,
        useFastTouch: true,
        useAnimations: false,
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
  $('ul.unread li.knot a[target="_blank"]').click(function() {
    $(this).parent('li').detach().appendTo('#read ul.read').end().click();
  });
});
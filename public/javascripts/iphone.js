var jQT = new $.jQTouch({
        statusBar: 'black-translucent',
        // icon: false,
        useFastTouch: true,
        useAnimations: false,
        preloadImages: [
            '/stylesheets/jqtouch/jqt/img/chevron.png',
            '/stylesheets/jqtouch/jqt/img/back_button.png',
            '/stylesheets/jqtouch/jqt/img/back_button_clicked.png',
            '/stylesheets/jqtouch/jqt/img/button_clicked.png',
            '/stylesheets/jqtouch/jqt/img/chevron_circle.png',
            ]
    });
    
$(function() {
  $('#home ul.unread li.knot a[target="_blank"]').tap(function() {
    $(this).parent('li').appendTo('#read ul.read');
  });
});
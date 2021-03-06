$().ready(function() {
  $('textarea.mceEditor').tinymce({
    // Location of TinyMCE script
    script_url : '/javascripts/tiny_mce/tiny_mce.js',
    content_css : "/stylesheets/reset.css, /stylesheets/typography.css, /stylesheets/content.css",
    relative_urls : false,
    convert_urls : false,
    // General options
    theme : "advanced",
    plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
    extended_valid_elements : "iframe[src|width|height|name|align|frameborder],table[valign],a[rel|rev|charset|hreflang|tabindex|accesskey|type|"
    + "name|href|target|title|class|onfocus|onblur|onmouseover|onmouseout]",



    // Theme options
    theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,bullist,numlist,|,outdent,indent,blockquote,|,formatselect,fontselect,fontsizeselect,forecolor,backcolor,|,undo,redo,",
    theme_advanced_buttons2 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,link,unlink,anchor,image,cleanup,help,code,|,fullscreen",
    theme_advanced_buttons3 : '',
    theme_advanced_toolbar_location : "top",
    theme_advanced_toolbar_align : "left",
    theme_advanced_statusbar_location : "bottom",
    theme_advanced_resizing : true,
  });
});

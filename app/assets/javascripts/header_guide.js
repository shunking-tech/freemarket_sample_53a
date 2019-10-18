$(function () {

  $(document).on('turbolinks:load', function (e) {
    var top_level_height = $(".ddmenu--top-level").height();
    $(".ddmenu--second-level").height(top_level_height);
    $(".ddmenu--third-level").height(top_level_height);

    // box-shadowのオン・オフ
    if ($(".breadcrumbs-wrap").length) {
      $(".mercari-header").removeClass('mercari-header--box-shadow');
    }
    else {
      $(".mercari-header").addClass('mercari-header--box-shadow');
    }

  });

})
$(function () {

  $(document).on('turbolinks:load', function (e) {
    var top_level_height = $(".ddmenu--top-level").height();
    $(".ddmenu--top-level ul").height(top_level_height);

    // box-shadowのオン・オフ
    if ($(".breadcrumbs-wrap").length) {
      $(".mercari-header").removeClass('mercari-header--box-shadow');
    }
    else {
      $(".mercari-header").addClass('mercari-header--box-shadow');
    }

    // マイページの矢印ホバー時の挙動
    $(".ddmenu__mypage li ul li a").hover(
      function (e) {
        $(this).children('i').css('opacity', '1');
        $(this).children('i').animate({ "right": '+=5px' }, "slow");
      },
      function (e) {
        $(this).children('i').css('opacity', '0.3')
        $(this).children('i').animate({ "right": '-=5px' }, "slow");
      }
    )
  });

})
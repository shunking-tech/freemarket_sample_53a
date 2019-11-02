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

    // ドロップダウンリストのホバー時の波形色
    $(".ddmenu--top-level").children('li').hover(
      function (e) {
        $(e.currentTarget).children('a').addClass('active_top')
      },
      function (e) {
        $(e.currentTarget).children('a').removeClass('active_top')
      }
    );

    $(".ddmenu--1-level").children('li').hover(
      function (e) {
        $(e.currentTarget).children('a').addClass('active_gray')
      },
      function (e) {
        $(e.currentTarget).children('a').removeClass('active_gray')
      }
    );

    $(".ddmenu--2-level").children('li').hover(
      function (e) {
        $(e.currentTarget).children('a').addClass('active_gray')
      },
      function (e) {
        $(e.currentTarget).children('a').removeClass('active_gray')
      }
    );

  });

})
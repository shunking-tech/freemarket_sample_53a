$(function () {

  $(document).on('turbolinks:load', function (e) {
    var photo_outer = $('.detail-item__photo--outer');
    var photo_width = photo_outer.width();
    var photo_count = photo_outer.children().length;
    
    // 大きい画像の枚数分、幅を拡大
    photo_outer.width(photo_width * photo_count);

    // 最初の小さい画像にactiveクラスをつける
    $('.detail-item__photo-small--image:first').addClass('active');

    // 小さい画像にホバーした時
    $('.detail-item__photo-small--image span').mouseover(
      function () {
        let hovered_image = $(this).parent();
        if (hovered_image.hasClass('active')) return false;

        hovered_image.siblings('.active').toggleClass('active');
        hovered_image.toggleClass('active');

        let mouseover_index = $(".detail-item__photo-small--image").index(hovered_image);
        $('.detail-item__photo--outer').animate({ "left": `-${photo_width * mouseover_index}px` }, "slow");
      }
    );

  });

})
$(function() {
  // 画面遷移時にtrade.jsを発火
  $(document).on('turbolinks:load', function(e) {

    // 購入フォーム
    let form = $(".buy-item__inner__form");

    // 購入情報の送信時に発火
    form.on('submit', function(e) {
      e.preventDefault();
      alert("商品の購入が完了しました。");
    });


    // 購入するボタン
    let btn = $('.buy-item__inner__form__submit');

    // カード情報がある時は購入するボタンを押せるように
    if ($('.buyer-info__inner__body').hasClass('default_card_information')) {
      btn.addClass('active');
    } else {
      btn.addClass('disabled');
      btn.prop('disabled', true);
    }

  });
});
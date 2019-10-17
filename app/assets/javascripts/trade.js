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

  });

});
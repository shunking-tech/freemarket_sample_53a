$(function() {

  // 画面遷移時にpayjp.jsを発火
  $(document).on('turbolinks:load', function (e) {

    // payjp公開鍵をセット
    Payjp.setPublicKey("pk_test_71652c9d19ffd414661cd4d8");

    // クレジットカード登録フォーム
    let form = $("#registration-card__form");
    // 追加するボタン
    let btn = $('#registration-card__form__content__submit');

    // カード番号入力時にハイフンを補完
    $(function(e) {
      $('[data-type="card"]').on("keydown keyup change", function(t) {
        var card_number = e(t.currentTarget)
          , number_length = card_number.val().length;
        // 入力されたキーによってキーコードを取得、数字が入力されたか判定
        if (t.keyCode >= 48 && t.keyCode <= 58 || t.keyCode >= 96 && t.keyCode <= 105 || 229 === t.keyCode)
          switch (number_length) {
            case 4:
            case 9:
            case 14:
              card_number.val(card_number.val() + "-")
          }
      })
    });

    // 追加するボタンのクリック時に発火
    btn.on('click', function(e) {
      e.preventDefault();

      // 入力されたクレカ情報を取得
      let card = {
        number: document.getElementById("card_number").value.replace(/-/g, ""),
        cvc: document.getElementById("card_securitycode").value,
        exp_month: document.getElementById("card_limit_m").value,
        exp_year: "20" + document.getElementById("card_limit_y").value,
      };

      // カード情報のトークン作成
      Payjp.createToken(card, (status, response) => {
        if (response.error) {
          alert("カード情報が正しくありません。");
        }
        else {
          // credit_cardsテーブルに不要なデータは送信しない
          $("#card_number").removeAttr("name");
          $("#card_securitycode").removeAttr("name");
          $("#card_limit_m").removeAttr("name");
          $("#card_limit_y").removeAttr("name");

          // トークンを送信
          form.append($('<input type="hidden" name="payjp_token">').val(response.id));
          form.submit();
          alert("カード情報の登録が完了しました。");
        }
      });

    });

  });

});
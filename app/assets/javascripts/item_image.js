$(function () {

  // 保存されている画像を編集・削除するための要素を生成する
  function create_html_file_edit(index, url){
    var html_edit_upload = `<li class="editmain__page__box__form__upload__first__ul__li" id="edit-upload-list${index}">
                              <figure class="editmain__page__box__form__upload__first__ul__li__image">
                                <img src=${url}>
                              </figure>
                              <div class="editmain__page__box__form__upload__first__ul__li__button">
                                <label class="editmain__page__box__form__upload__first__ul__li__button__edit" id="edit-upload-button${index}" for="item_item_images_attributes_${index}_image">編集</label>
                                <a class="editmain__page__box__form__upload__first__ul__li__button__delete" id="delete-upload-button${index}">削除</a>
                              </div>
                            </li>`
    $('.editmain__page__box__form__upload__first__ul').append(html_edit_upload);
  }
  // アップロードフォームを保存されている画像の数によって再構築する
  function rebuild_html_file_new(number_images, delete_uploader_index = number_images){
    // loadイベントの時、アップロードフォームが１つ余計に生成されるため、画像の数とアップロードフォームのインデックスが同じなら、アップロードフォームのラベルを削除する
    if (number_images == delete_uploader_index && location.pathname.match('edit')) {
      $('.editmain__page__box__form__upload__first__pc').remove([delete_uploader_index]);
    }
    // アップロードフォームのラベル数を取得
    var number_labels = $('.editmain__page__box__form__upload__first__pc').length;
    if ($('.new_image')) {
      $('.new_image').attr('class','editmain__page__box__form__upload__first__pc');
    }
    // 画像の数によってアップロードフォームの幅を変える
    var upload_width = 620 - 126*(number_images);
    if (number_images > 4) {
      upload_width += 630
    }
    if (number_images < 10) {
      var html_new_upload = `<label class="editmain__page__box__form__upload__first__pc" for="item_item_images_attributes_${number_labels}_image" style="width: calc(${upload_width}px);">
                              <input class="editmain__page__box__form__upload__first__pc__print new_image" type="file" name="item[item_images_attributes][${number_labels}][image]" id="item_item_images_attributes_${number_labels}_image">
                              <pre class="editmain__page__box__form__upload__first__pc__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</pre>
                              <i class="icon-camera"></i>
                            </label>`
      $('.editmain__page__box__form__upload__first__pc').hide();
      // loadイベントの時、アップロードフォームが１つ余計に生成されるため、画像の数とアップロードフォームのインデックスが同じなら、アップロードフォームを削除する
      $('.overflow-auto').append(html_new_upload);
    } else {
        // 画像が10枚の時アップロードフォームを消す
        $('.editmain__page__box__form__upload__first__pc').hide();
      }
  }


  // 読み込み時
  $(document).on('turbolinks:load', function() {
    // 画像をアップロードするフォームの要素を取得
    var label_file_upload = $('.editmain__page__box__form__upload__first__pc');
    // 保存されている画像の数 配列の最後の要素は画像が保存されていなくても表示されるフォームであるため、-1する
    var number_images = label_file_upload.length - 1
    // アップロードのフォームが2つ以上ある時、つまり、保存されている時がある時
    if (label_file_upload.length > 1) {
      // 保存されている画像の数の分だけループを回す
      for(let i = 0; i < number_images; i++){
        create_html_file_edit(i, gon.item_images[i].image.url);
      }
      rebuild_html_file_new(number_images);
    }
  });


  // 新規の画像を選択した時
  $(document).on('change', '.new_image', function(e) {
    // アップロードされている画像
    let current_images = $('.editmain__page__box__form__upload__first__ul').children('li');
    // 画像の数を取得
    let number_images = current_images.length;
    // 保存されている最後の画像
    let images_last_list = current_images.last();
    // 保存されている最後の画像のインデックス
    var images_last_index;

    if (location.pathname.match('edit')) {
      if (images_last_list) {
        images_last_index = parseFloat(current_images[0].getAttribute('id').replace('edit-upload-list', ''));
      } else {
          // 最後の画像のインデックスを仮に-1とする
          images_last_index = -1;
        }
    } else if (location.pathname.match('new')) {
      images_last_index = parseFloat($($('.sellmain__page__box__form__upload__first__ul__li__button__delete').parents('li')[0])['selector']+number_images);
      }
    // 選択された画像のデータを取得
    var image_data = e.target.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(image_data);
    reader.onload = function(load_image_e) {
      create_html_file_edit(images_last_index+1, load_image_e.target.result);
    }
    rebuild_html_file_new(number_images+1);
  })


  // 保存されている画像の「編集」をクリックした時
  $(document).on('click', '.editmain__page__box__form__upload__first__ul__li__button__edit', function(click_e) {

    //「編集」をクリックされた画像のインデックスを取得
    var image_index = click_e.target.getAttribute('id').replace('edit-upload-button', '');
    // 画像のinputタグの内容が変更された時(「編集」をクリックした時のイベントにネスト)
    $(document).on('change', `input[id*=${image_index}]`, function(change_e) {
      // 選択された画像のデータを取得
      var image_data = change_e.target.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(image_data);
      reader.onload = function(load_image_e) {
        $(click_e.target).parent().parent().find('figure').find('img').attr('src', load_image_e.target.result );
      }
    })

  })


  // 保存されている画像の「削除」をクリックした時
  $(document).on('click', '.editmain__page__box__form__upload__first__ul__li__button__delete', function(e) {
    // クリックされた要素を取得
    var delete_item = $(e.currentTarget);
    // 画像を編集するための要素を削除する
    delete_item.parents('li').remove();

    // 保存されている画像のinputタグを取得
    var saved_image_input_tags = $('input[type="hidden"][id]');

    // クリックされた要素のidから番号のみ抜き出す
    var target_id_number = delete_item.attr('id').replace('delete-upload-button', '');

    // クリックした要素と対応する画像のinputタグを取得
    var clicked_saved_image_input_tag = saved_image_input_tags[target_id_number];

    // inputタグのvalue属性から画像のidを取得
    var clicked_saved_image_id = clicked_saved_image_input_tag.getAttribute("value");

    // paramsに削除する画像のidを渡すためのinput(type="hidden")タグを生成する
    var create_html_input_delete_image_id = `<input type="hidden" name="delete_image_id[]" value="${clicked_saved_image_id}">`;
    $('.overflow-auto').append(create_html_input_delete_image_id);

    // 画像の数を取得
    var number_images = $('.editmain__page__box__form__upload__first__ul__li__button__delete').parents('li').length;
    rebuild_html_file_new(number_images, target_id_number);
  })


});

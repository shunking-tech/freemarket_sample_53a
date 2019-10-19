$(function (){
  var deleted_images_counter = 0;
  // 読み込み時
  $(window).on('load', function(){
    // 画像をアップロードするフォームの要素を取得
    var label_file_upload = document.getElementsByClassName('editmain__page__box__form__upload__first__pc')
    var number_images = label_file_upload.length - 1      // 保存されている画像の数 配列の最後の要素は画像が保存されていなくても表示されるフォームであるため、-1する
    if(label_file_upload.length > 1){       // アップロードのフォームが2つ以上ある時、つまり、保存されている時がある時
      // 保存されている画像の数の分だけループを回す
      for(let i = 0; i < number_images; i++){
        create_html_file_edit(i, gon.item_images[i].image.url);
      }
      rebuild_html_file_new(number_images);
    }

    view_calc_fee_profit();
  })

  // 価格入力時
  $('.input-fee').on('input', function(){
    view_calc_fee_profit();
  })

  // 新規の画像を選択した時
  $(document).on('change', '.new_image', function(e){
    console.log('new_image_selected!!!')
    console.log("削除された画像の数"+deleted_images_counter);

    // 画像の数を取得
    var number_images = $('.editmain__page__box__form__upload__first__ul__li__button__delete').parents('li').length;
    console.log("保存されている画像の枚数"+number_images);

    // 保存されている最後の画像
    var images_last_list = $('.editmain__page__box__form__upload__first__ul__li__button__delete').parents('li')[0];
    var images_last_index; // 保存されている最後の画像のインデックス
    if(images_last_list){ // 保存されている画像がある時
      images_last_index = parseFloat($('.editmain__page__box__form__upload__first__ul__li__button__delete').parents('li')[0].getAttribute('id').replace('edit-upload-list', ''));
    }else{  // 保存されている画像がない時
      images_last_index = -1;   // 最後の画像のインデックスを仮に-1とする
    }
    console.log(images_last_index);
    var image_data = e.target.files[0];   // 選択された画像のデータを取得
    var reader = new FileReader();
    reader.readAsDataURL(image_data);
    reader.onload = function(load_image_e) {
      console.log("画像追加前の最後のインデックス"+images_last_index);
      create_html_file_edit(images_last_index+1, load_image_e.target.result);
    }

    // 画像追加後の数を取得
    // number_images += 1;
    // 削除するアップローダーのインデックス
    // var delete_uploader_index = parseFloat($($('.editmain__page__box__form__upload__first__ul__li__button__delete').parents('li')[0].getAttribute('id').replace('edit-upload-list', ''))['selector'])+1;
    // console.log("削除するアップロードフォームのインデックス"+delete_uploader_index);
    console.log("画像追加後の数"+number_images+1);
    // rebuild_html_file_new(number_images+1, delete_uploader_index);
    rebuild_html_file_new(number_images+1);
  })

  // 保存されている画像の「編集」をクリックした時
  $(document).on('click', '.editmain__page__box__form__upload__first__ul__li__button__edit', function(click_e){
    console.log('edit_click!!!')
    var image_index = click_e.target.getAttribute('id').replace('edit-upload-button', ''); // 「編集」をクリックされた画像のインデックスを取得
    console.log("画像のインデックス＝" + image_index);
    // 画像のinputタグの内容が変更された時(「編集」をクリックした時のイベントにネスト)
    $(document).on('change', `input[id*=${image_index}]`, function(change_e){
      console.log('image_change!!!')
      var image_data = change_e.target.files[0];   // 選択された画像のデータを取得
      console.log("選択された画像データ↓");
      console.log(image_data);

      var reader = new FileReader();
      reader.readAsDataURL(image_data);
      reader.onload = function(load_image_e) {
        $(click_e.target).parent().parent().find('figure').find('img').attr('src', load_image_e.target.result );
        console.log("クリックされた「編集」の親の親要素↓");
        console.log($(click_e.target).parent().parent());
        console.log("imgタグに反映された選択された画像のURL＝" + $(click_e.target).parents('li').find('figure').find('img').attr('src'));
      }
    })
  })

  // 保存されている画像の「削除」をクリックした時
  $(document).on('click', '.editmain__page__box__form__upload__first__ul__li__button__delete', function(e){
    var target = $(e.target);             // クリックされた要素を取得
    var saved_image_input_tags = $('input[type="hidden"][id]');                 // 保存されている画像のinputタグを取得
    var target_id_number = target.attr('id').replace('delete-upload-button', '');     // クリックされた要素のidから番号のみ抜き出す
    var clicked_saved_image_input_tag = saved_image_input_tags[target_id_number];     // クリックした要素と対応する画像のinputタグを取得
    var clicked_saved_image_id = clicked_saved_image_input_tag.getAttribute("value"); // inputタグのvalue属性から画像のidを取得
    
    // paramsに削除する画像のidを渡すためのinput(type="hidden")タグを生成する
    var create_html_input_delete_image_id = `<input type="hidden" name="delete_image_id[]" value="${clicked_saved_image_id}">`;
    $('.overflow-auto').append(create_html_input_delete_image_id);

    // 画像を編集するための要素を削除する
    target.parents('li').remove();

    // 新規画像アップロードフォームの幅を変えて再構築
    var number_images = $('.editmain__page__box__form__upload__first__ul__li__button__delete').parents('li').length;  // 画像の数を取得
    rebuild_html_file_new(number_images, target_id_number);
    deleted_images_counter += 1;
    console.log("削除された画像の数"+deleted_images_counter);
  })



  //--------------以下、メソッド--------------
  
  // 販売手数料と販売利益を計算して、表示に反映させる
  function view_calc_fee_profit(){
    var price = $('.input-fee').val();
    var fee = Math.floor(price * 0.1);
    var profit = price - fee;
    if(price >= 300){
      $('.edit-money__fee__right').text('¥' + fee);
      $('.edit-money__profit__right').text('¥' + profit);
    }else{
      $('.edit-money__fee__right').text('-');
      $('.edit-money__profit__right').text('-');
    }
  }

  // 保存されている画像を編集・削除するための要素を生成する
  function create_html_file_edit(index, url){
    console.log("create_html_file_edit!!!")
    console.log("追加する編集要素のインデックス"+index)
    var html_edit_upload = `
                          <li class="editmain__page__box__form__upload__first__ul__li" id="edit-upload-list${index}">
                            <figure class="editmain__page__box__form__upload__first__ul__li__image">
                              <img src=${url}>
                            </figure>
                            <div class="editmain__page__box__form__upload__first__ul__li__button">
                              <label class="editmain__page__box__form__upload__first__ul__li__button__edit" id="edit-upload-button${index}" for="item_item_images_attributes_${index}_image">編集</label>
                              <a class="editmain__page__box__form__upload__first__ul__li__button__delete" id="delete-upload-button${index}">削除</a>
                            </div>
                          </li>
                            `
    $('.editmain__page__box__form__upload__first__ul').append(html_edit_upload);
  }

  // アップロードフォームを保存されている画像の数によって再構築する
  function rebuild_html_file_new(number_images, delete_uploader_index = number_images){
    console.log('rebuild!!!');
    console.log("削除するアップロードフォームのインデックス　"+delete_uploader_index);
    console.log("画像の数　"+number_images);
    // loadイベントの時、アップロードフォームが１つ余計に生成されるため、画像の数とアップロードフォームのインデックスが同じなら、アップロードフォームのラベルを削除する
    if(number_images == delete_uploader_index){
      $('.editmain__page__box__form__upload__first__pc')[delete_uploader_index].remove();
    }
    var number_labels = $('.editmain__page__box__form__upload__first__pc').length; // アップロードフォームのラベル数を取得
    console.log("labelの数　"+number_labels);
    if($('.new_image')){
      $('.new_image').attr('class','editmain__page__box__form__upload__first__pc');
    }
    var upload_width = 620 - 126*(number_images);   // 画像の数によってアップロードフォームの幅を変える
    if (number_images > 4){     // 保存されている画像の数が5枚以上の時
      upload_width += 630
    }
    if(number_images < 10){      // 画像が10枚未満の時、アップロードフォームを再構築
      // number_images += 10;
      var html_new_upload = `
      <label class="editmain__page__box__form__upload__first__pc" for="item_item_images_attributes_${number_labels}_image" style="width: calc(${upload_width}px);">
        <input class="editmain__page__box__form__upload__first__pc__print new_image" type="file" name="item[item_images_attributes][${number_labels}][image]" id="item_item_images_attributes_${number_labels}_image">
        <pre class="editmain__page__box__form__upload__first__pc__text">
ドラッグアンドドロップ
またはクリックしてファイルをアップロード
        </pre>
        <i class="icon-camera"></i>
      </label>
      `
      $('.editmain__page__box__form__upload__first__pc').hide();
      // // loadイベントの時、アップロードフォームが１つ余計に生成されるため、画像の数とアップロードフォームのインデックスが同じなら、アップロードフォームを削除する
      // if(number_images == delete_uploader_index){
      //   $('.editmain__page__box__form__upload__first__pc')[delete_uploader_index].remove();
      // }
      // $('.editmain__page__box__form__upload__first__pc__print')[delete_uploader_index].remove();
      console.log("labelの数　"+$('.editmain__page__box__form__upload__first__pc').length);
      console.log("inputの数　"+$('.editmain__page__box__form__upload__first__pc__print').length);
      $('.overflow-auto').append(html_new_upload);
    }else{      // 画像が10枚の時アップロードフォームを消す
      $('.editmain__page__box__form__upload__first__pc').hide();
    }
  }
})
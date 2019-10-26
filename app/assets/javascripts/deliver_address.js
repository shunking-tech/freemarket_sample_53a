$(function() {
  $(".input-zipcode").on("keyup keydown change", function(e) {
    let zipcode = $(this).val();
    switch (zipcode.length) {
      case 4:
        if (zipcode.slice(-1) != "-" && e.keyCode != 8) {
          let result = zipcode.slice(0, 3) + "-" + zipcode.slice(-1);
          $(this).val(result);
        }
    }
  });
});

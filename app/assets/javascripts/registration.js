$(function(){
  let getLastDay = (year, month) => {
    return new Date(year, month, 0).getDate();
  };

  $("#month").on("change", function(){
    let e_day = $("#day");
    e_day.html("<option value>--</option>");
    let year = $("#year option:selected").val();
    let month = $("#month option:selected").val();
    let lastDay = getLastDay(year, month);
    for(let i=1;i<=lastDay;i++){
      e_day.append(`<option value="${i}">${i}</option>`);
    }
    if(!month) e_day.html("<option value>--</option>");
    $("#user_birth_date").val("");
  });

  $("#year").on("change", function(){
    let year = $("#year option:selected").val();
    let month = $("#month option:selected").val();
    if (month == 2){
      let value = $("#day option:last-child").val();
      if (year%4 == 0){
        if (value == 28) $("#day").append('<option value="29">29</option>');
      }else{
        if (value == 29) $("#day option:last-child").remove();
      }
    }
    let day = $("#day option:selected").val();
    if (year && month && day){
      $("#user_birth_date").val(`${year}/${month}/${day}`);
    }else{
      $("#user_birth_date").val("");
    }
  });

  $("#day").on("change", function(){
    let year = $("#year option:selected").val();
    let month = $("#month option:selected").val();
    let day = $("#day option:selected").val();
    if (year && month && day){
      $("#user_birth_date").val(`${year}/${month}/${day}`);
    }else{
      $("#user_birth_date").val("");
    }
  });
});
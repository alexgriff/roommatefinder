app.habits.controller = {
  edit: function(event) {
    // habit question page elements
    var habit_items = ['partying-habit', 'drinking-habit', 'four-twenty-habit', 'overnight-visitors-habit',
    'music-habit', 'roommate-partying-habit', 'roommate-drinking-habit', 'roommate-four-twenty-habit',
    'roommate-overnight-visitors-habit', 'roommate-music-habit', 'submit-habit-questions'];

    habit_items.forEach(function(element){
      $('#' + element).hide();
    });
    $('#' + habit_items[0]).show();
    $('#' + habit_items[0]).addClass("current-question");

    habit_items.forEach(function(element, index, element_arr){
      $('#submit-' + element).on("click", function(event){
        event.preventDefault();
        if (index != element_arr.length - 1) {
          $('.current-question').fadeOut(400);
          $('.current-question').removeClass("current-question");
          $('#' + element_arr[index + 1]).addClass("current-question");
          if ($('.current-question').attr('id').split('-')[0] === "roommate") {
            $('.questions-heading').text("Tell Us About Your Ideal Roommate's Habits");
          }
          $('.current-question').delay(600).fadeIn(500);
        }
      });
    });

    habit_items.forEach(function(element, index, element_arr){
      $('#go-to-' + element).on("click", function(event){
        $('.current-question').fadeOut(400);
        $('.current-question').removeClass("current-question");
        $('#' + element).addClass("current-question");
        if ($('.current-question').attr('id').split('-')[0] === "roommate") {
          $('.questions-heading').text("Tell Us About Your Ideal Roommate's Habits");
        }
        else {
          $('.questions-heading').text("Tell Us About Yourself");
        }
        $('.current-question').delay(600).fadeIn(500);
      });
    });
  }
}

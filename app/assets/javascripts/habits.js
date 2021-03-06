app.habits.controller = {
  edit: function() {
    // habit question page elements
    var habit_items = ['partying-habit', 'drinking-habit', 'four-twenty-habit', 'overnight-visitors-habit',
    'music-habit', 'roommate-partying-habit', 'roommate-drinking-habit', 'roommate-four-twenty-habit',
    'roommate-overnight-visitors-habit', 'roommate-music-habit', 'submit-habit-questions'];

    habit_items.forEach(function(element){
      $('#' + element).hide();
    });
    $('#' + habit_items[0]).show();
    $('#' + habit_items[0]).addClass("current-question");
    $('#go-to-' + habit_items[0]).addClass("current-question-nav");

    habit_items.forEach(function(element, index, element_arr){
      $('#submit-' + element).on("click", function(event){
        event.preventDefault();
        $('.current-question').fadeOut(400);
        $('.current-question').removeClass("current-question");
        $('.current-question-nav').removeClass("current-question-nav");
        $('#go-to-' + element_arr[index + 1]).addClass("current-question-nav");
        $('#' + element_arr[index + 1]).addClass("current-question");
        if ($('.current-question').attr('id').split('-')[0] === "roommate") {
          $('.questions-heading').text("Tell Us About Your Ideal Roommate's Habits");
        }
        $('.current-question').delay(600).fadeIn(500);
      });
    });

    habit_items.forEach(function(element, index, element_arr){
      $('#back-' + element).on("click", function(event){
        event.preventDefault();
        $('.current-question').fadeOut(400);
        $('.current-question').removeClass("current-question");
        $('.current-question-nav').removeClass("current-question-nav");
        $('#go-to-' + element_arr[index - 1]).addClass("current-question-nav");
        $('#' + element_arr[index - 1]).addClass("current-question");
        if ($('.current-question').attr('id').split('-')[0] === "roommate") {
          $('.questions-heading').text("Tell Us About Your Ideal Roommate's Habits");
        }
        $('.current-question').delay(600).fadeIn(500);
      });
    });

    habit_items.forEach(function(element, index, element_arr){
      $('#go-to-' + element).on("click", function(event){
        $('.current-question').fadeOut(400);
        $('.current-question').removeClass("current-question");
        $('.current-question-nav').removeClass("current-question-nav");
        $('#go-to-' + element).addClass("current-question-nav");
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
  },
  show: function(){
    $('a#habit-section').on("click", function(event){
      event.preventDefault();
      var link = $('#habit-section').attr('href');
       $.ajax({
          url: link,
          method: 'GET',
    
          success: function(data){ 
            $('.revealSection').html(data);
            app.habits.controller.edit();  
          }
       });
    });
  }
}


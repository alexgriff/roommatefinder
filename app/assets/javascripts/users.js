app.user.controller = {
  init: {
    $.ajax({
      // url: '/boards/'+ window.location.href.substring(29),
      // method: 'GET',
      // dataType: "JSON",
      // success: (function(data){

      })
  }
}

app.user.model = {
  new: (function(){
    function User(name, username, email, birthdate, gender, dealbreakers, has_apartment, max_rent, photo){
      this.name = name;
      this.username = username;
      this.email = email;
      this.birthdate = birthdate;
      this.gender = gender;
      this.dealbreakers = dealbreakers;
      this.has_apartment = has_apartment;
      this.max_rent = max_rent;
      this.photo = photo;
    }
    return User;
  })()
}



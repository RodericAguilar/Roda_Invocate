

$(function(){

    window.addEventListener("message", function(event){

        if ( event.data.trans == false ) {
            var selector = document.querySelector("html")
            selector.style = "display:none;"
        }
        if ( event.data.trans == true   ) {
            var selector = document.querySelector("html")
            selector.style = "display:block;"
        }

        if ( event.data.vel <= 0 ) {
            var hola = document.getElementById("segundo")
            $("#segundo").fadeOut(1000);
        } else {
            var hola = document.getElementById("segundo")
            hola.style = "display:block;"
        }

        if ( event.data.cooldown2 <= 0 ) {
            $("#cooldown").fadeOut(1000);
        } else {
            var chau = document.getElementById("cooldown")
            chau.style = "display:block;"
        }

        $("#segundo").html("Tiempo Restante: "+event.data.vel);
        $("#cooldown").html("Cooldown: "+event.data.cooldown2);
        
    })
        
})


document.addEventListener("DOMContentLoaded", () => {
    $("html").hide();
});

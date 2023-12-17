// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(window).on("load", function() {
$('#sec-1').addClass("active");

/*Smooth scrolling */

$("#sec-1").click(function () {
    $(".container_nav ul li").children().removeClass("active");
    $('#sec-1').addClass("active");
    $('#sec-1').addClass("clicked");
    $('html, body').animate({
        scrollTop: $("#welcome-index-leader").offset().top - 66
    }, 1000, complete = function () {
        $("#sec-1").removeClass("clicked");
    });

    return false;
});

$("#sec-2").click(function () {
    $(".container_nav ul li").children().removeClass("active");
    $('#sec-2').addClass("active");
    $('#sec-2').addClass("clicked");
    $('html, body').animate({
        scrollTop: $("#welcome-index-when-where").offset().top - 112
    }, 1000, complete = function () {
        $("#sec-2").removeClass("clicked");
    });
    return false;
});

$("#sec-3").click(function () {
    $(".container_nav ul li").children().removeClass("active");
    $('#sec-3').addClass("active");
    $('#sec-3').addClass("clicked");
    $(' html,body').animate({
        scrollTop: $("#welcome-index-venue-leader").offset().top - 112
    }, 1000, complete = function () {
        $("#sec-3").removeClass("clicked");
    });


    return false;
});

$("#sec-4").click(function () {
    $(".container_nav ul li").children().removeClass("active");
    $('#sec-4').addClass("active");
    $('#sec-4').addClass("clicked");
    // $(this).addClass("active");
    $('html,body ').animate({
        scrollTop: $("#welcome-index-wedding-plan-leader").offset().top - 112
    }, 1000, complete = function () {
        $("#sec-4").removeClass("clicked");
    });


    return false;
});

waypoint1 = new Waypoint({
    element: document.getElementById('welcome-index-leader'),
    handler: function () 
        {
            if (!$('.clicked').length) {
                $(".container_nav ul li").children().removeClass("active");
                $("#sec-1").addClass("active");
            }
        }
})

waypoint2 = new Waypoint({
    element: document.getElementById('welcome-index-when-where'),
    handler: function () 
    {
        if (!$('.clicked').length) {
            $(".container_nav ul li").children().removeClass("active");
            $("#sec-2").addClass("active");
        }
    }, offset: 101, continuous: false
})

waypoint3 = new Waypoint({
    element: document.getElementById('welcome-index-venue-leader'),
    handler: function () {

        if (!$('.clicked').length) {
            $(".container_nav ul li").children().removeClass("active");
            $("#sec-3").addClass("active");
        }
    }, offset: 101, continuous: false
})

    waypoint4 = new Waypoint({
        element: document.getElementById('welcome-index-wedding-plan-leader'),
        handler: function () {
            if (!$('.clicked').length) {
                $(".container_nav ul li").children().removeClass("active");
                $("#sec-4").addClass("active");
            }
        }, offset: 101, continuous: false
    })

// $('#welcome-index-leader').waypoint(function () {
//     $(".container_nav ul li").children().removeClass("active");
//     $("#sec-1").addClass("active");
// }, { offset: 0 });

// $('#welcome-index-when-where').waypoint(function () {

//     $(".container_nav ul li").children().removeClass("active");
//     $("#sec-2").addClass("active");

// }, { offset: 101 });


// $('#welcome-index-venue-leader').waypoint(function () {
//     $(".container_nav ul li").children().removeClass("active");
//     $("#sec-3").addClass("active");
// }, { offset: 101 });

// $('#welcome-index-wedding-plan-leader').waypoint(function () {
//     $(".container_nav ul li").children().removeClass("active");
//     $("#sec-4").addClass("active");
// }, { offset: 101 });

})
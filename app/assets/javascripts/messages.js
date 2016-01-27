/**
 * Created by francis on 11/18/15.
 */
$(document).ready(function() {
    $('form.contact').submit(function(event) {

        // Create a form variable
        var form = $(this);

        // Start the loading animation
        var button = form.find('button');
        button.removeClass('submit');
        button.addClass('submit-loading');

        // Delete the old errors if there are any
        form.find('.errors').remove();

        // Prevent the form from submitting
        event.preventDefault();

        // Post the form data
        var timer = window.setInterval(function() {
            $.ajax({
                type: "POST",
                url: $(form).attr('action'),
                data: $(form).serialize(),
                dataType: 'JSON',
                success: function(data) {
                    // Hide the form and display a thank you message
                    form.animate({
                        'opacity': 0
                    }, 500, function() {
                        form.css('display', 'none');
                        $('<h2 class="center"></h2>').text("Thanks for getting in touch " + data.name).insertAfter(form);
                    });
                },
                error: function(data) {

                    // The area to place errors
                    var errorContainer = $('<div class="errors full center"></div>').insertBefore(form.find('.after-errors'));

                    // An object of errors
                    var errors = $.parseJSON(data.responseText).errors;

                    for (var error in errors) {
                        $('<p></p>').text(errors[error][0]).appendTo(errorContainer);
                    }

                    // Reset the button
                    button.removeClass('submit-loading');
                    button.addClass('submit');
                }
            });
            window.clearInterval(timer);
        }, 1000);
    });
});
/**
 * Created by francis on 11/21/15.
 */
$(window).load(function() {
    /**
     * The projects collection.
     * @type {*|jQuery|HTMLElement}
     */
    var projects = $('.projects > section');

    /**
     * Provides the opacity animations when you hover over skills.
     */
    projects.on("mouseenter", function() {
        projects.not($(this)).stop().animate({
            opacity: 0.4
        }, 150);
    }).on("mouseleave", function() {
        projects.stop().animate({
            opacity: 1
        }, 150);
    });
});
/**
 * Created by francis on 11/18/15.
 */

$(window).load(function() {
    var max_height = 0;
    var skills = $('.skills > div');
    skills.each(function() {
        max_height = Math.max(max_height, $(this).height());
    });
    skills.height(max_height);
});

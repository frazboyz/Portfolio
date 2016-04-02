/**
 * Created by francis on 11/18/15.
 */
"use strict";
$(window).load(function () {
    /**
     * The skills collection.
     * @type {*|jQuery|HTMLElement}
     */
    var skills = $('.skills > section');

    /**
     * Calculate the maximum height for the skill boxes and
     * set the skill boxes to all have the maximum height.
     * @type {number}
     */
    var max_height = 0;
    skills.each(function () {
        max_height = Math.max(max_height, $(this).height());
    });
    skills.height(max_height);
});
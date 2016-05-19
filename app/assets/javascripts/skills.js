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
     * The summaries collection.
     * @type {*|jQuery|HTMLElement}
     */
    var summaries = $('.skills > section p');

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

    /**
     * Calculate and set the maximum height for each of
     * the summaries in the skill boxes.
     * @type {number}
     */
    max_height = 0;
    summaries.each(function () {
        max_height = Math.max(max_height, $(this).height());
    });
    summaries.height(max_height);
});
/**
 * Banner.js may to be included inside "Sales Banner" iframe content
 * May to handle click event on link
 */
if (typeof browser === "undefined") {
    window['browser'] = chrome;
}
browser.runtime.sendMessage({ action: 'banner_init' });
var links = document.querySelectorAll('a');
links.forEach(function (element) {
    element.addEventListener('click', function (event) {
        event.preventDefault();
        var link = element.getAttribute('href');
        browser.runtime.sendMessage({ action: 'banner_click', link: link });
    });
});

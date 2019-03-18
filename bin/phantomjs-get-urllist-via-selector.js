var args = require('system').args;
var page = require('webpage').create();

const base_url = args[1];
const selector = args[2];

function usage() {
    console.log('Usage: phantom phantomjs-get-urllist-via-selector.js <base_url>');
}

page.open(base_url, function(status) {

    if (args.length < 3) {
        usage();
    }

    var links = page.evaluate(function(selector) {
        return [].map.call(document.querySelectorAll(selector), function(link) {
            return link.getAttribute('href');
        });
    }, selector);
    console.log(links.join('\n'));
    phantom.exit();
});

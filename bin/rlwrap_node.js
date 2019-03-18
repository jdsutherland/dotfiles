#!/usr/bin/env node

// terminal:false disables readline (just like env NODE_NO_READLINE=1):
var myrepl = require("repl").start({ terminal: false });

// add REPL command rlwrap_complete(prefix) that prints a simple list of completions of prefix
myrepl.context["rlwrap_complete"] = function(prefix) {
  myrepl.complete(prefix, function(err, data) {
    for (x of data[0]) {
      console.log(x);
    }
  });
};

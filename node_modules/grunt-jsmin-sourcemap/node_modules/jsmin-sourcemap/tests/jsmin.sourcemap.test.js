var vows = require('vows'),
    traverse = require('traverse'),
    commands = require('./jsmin.sourcemap.commands.js');

// Theoretical setup for TestDriver class
// var engines = {};
// function addEngine(name, engine) {
//   engines[name] = engine;
// }

// function TestDriver(engineName) {
//   // Grab and localize the engine
//   var engine = engines[engineName];
//   this.engine = engine;

//   // TODO: We might want to create SuiteDriver
//   this.suite = engine.createSuite();
//   this.batches = [];
// }
// TestDriver.prototype = {
//   'addBatch': function (inBatch) {
//     var outBatch = addCommands(inBatch);
//     this.suite.addBatch(outBatch);
//   }
// };

function addCommands(batch) {
  // Traverse over the batch
  traverse(batch).forEach(function traverseBatch (node) {
    var key = this.key;

    // If there is a key
    if (key) {
      // Look up the command for it
      var command = commands[key];

      // If there is a command
      if (command) {
        // If the node is an object
        if (typeof node === 'object') {
          // Add it as a topic
          var topic = node.topic || command;

          // DEV: Wrap the topic inside of a try/catch for debugging
          node.topic = function () {
            var retVal;
            try {
              retVal = topic.apply(this, arguments);
            } catch (e) {
              console.error(e);
            }
            return retVal;
          };
        } else {
          // Otherwise, save it over the node itself
          node = command;
        }
      }
    }

    // Return the node
    return node;
  });

  // Return the batch
  return batch;
}

// Set up the vows suite
var suite = vows.describe('jsmin-sourcemap'),
    // batches = eval(require('fs').readFileSync(__dirname + '/jsmin.sourcemap.tests.json', 'utf8'));
    batches = require('./jsmin.sourcemap.tests.json');

// Generate each batch and add it to the suite
batches.forEach(function (_batch) {
  var batch = addCommands(_batch);
  suite.addBatch(batch);
});

// TODO: Multi-nested

// Export the batch as a suite
suite['export'](module);
// all tests
var tests = {
  zngoose: './lib/zngoose'
};

// tests that will be run
var runTests = [
  'zngoose'
];

function loadTest(testName) {
  require(tests[testName]);
}

describe('zngoose', () => {
  runTests.forEach((test) => {
    loadTest(test);
  });
});

# Rails Project Template

This is a small Rails project that tests the performance of various Rails
templating engines.

## Results

Three scenarios were created for each templating engine: a simple template with
some dynamic content, a template containing some partials, and a complex
template with multiple partials and features, including a layout and multiple
yields.

Each test was run 5 times, and the quickest three results were averaged to get
the time for each scenario. The tests are then benchmarked against rendering an
identical raw HTML file.

In these first results, we ran the tests with Rails' caching enabled. The
template was compiled once by the templating engine, then the compiled code run
5000 times:

|        | Simple       | Partials     | Complex      |
|--------|--------------|--------------|--------------|
| Raw    | 3.371852667s | 3.405484667s | 3.353841667s |
| ERB    | -0.75%       | +47.30%      | +77.82%      |
| HAML   | +1.80%       | +48.49%      | +80.85%      |
| RBlade | +3.88%       | +38.81%      | +55.82%      |
| Slim   | +0.74%       | +46.06%      | +78.19%      |

We can see that there is a negligible different for the simple template, with
RBlade being slightly slower. However, as the templates become more complex, 
RBlade is noticeably faster compared to the other engines, which remained
fairly on par.

In this next set of results, we ran the tests with Rails' caching disabled.
Each template is compiled a total of 1000 times:

|        | Simple       | Partials     | Complex      |
|--------|--------------|--------------|--------------|
| Raw    | 1.325865333s | 1.347251333s | 1.476958667s |
| ERB    | +21.56%      | +64.09%      | +139.70%     |
| HAML   | +380.55%     | +533.48%     | +1297.95%    |
| RBlade | +74.87%      | +151.39%     | +452.93%     |
| Slim   | +316.84%     | +501.28%     | +1208.38%    |

These results aren't particularly insightful because Rails will always cache the
compiled templates in any real scenario. However, we can at least see that the
compilation time for any engine will not significantly affect the performance of
an application: the slowest compilation average was 20 milliseconds.

## Setup

This project requires [docker](https://www.docker.com/) to be installed.

Build the docker image:
```shell
./do build
```

Start the docker server:
```shell
./do up
```

Run the tests:
```shell
./do test
```

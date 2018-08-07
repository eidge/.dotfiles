var screens = {
  left: "0",
  center: "1",
  right: "2",
};

var apps = {
  Spotify: {
    "justTheMac": screens.left,
    "threeMonitors": screens.left,
  },
  iTerm2: {
    "justTheMac": screens.left,
    "threeMonitors": screens.center,
  },
  "Google Chrome": {
    "justTheMac": screens.left,
    "threeMonitors": screens.right,
  },
  Calendar: {
    "justTheMac": screens.left,
    "threeMonitors": screens.left,
  },
  Slack: {
    "justTheMac": screens.left,
    "threeMonitors": screens.left,
  },
}

function focus(app) {
  return slate.operation("focus", { app: app });
}

function fullscreenOn(screen) {
  return slate.operation("move", {
    screen: screen,
    x: "screenOriginX",
    y: "screenOriginY",
    width: "screenSizeX",
    height: "screenSizeY",
  });
}

function buildLayout(name, apps) {
}

slate.layout("threeMonitors", {
  _after_: { operations: [focus("iTerm2")] },
  Spotify: { operations: [fullscreenOn(screens.left)] },
  iTerm2: { operations: [fullscreenOn(screens.center)] },
  "Google Chrome": { operations: [fullscreenOn(screens.right)] },
  Calendar: { operations: [fullscreenOn(screens.left)] },
  Slack: { operations: [fullscreenOn(screens.left)] },
})

slate.layout("justTheMac", {
  _after_: { operations: [focus("iTerm2")] },
  Spotify: { operations: [fullscreenOn(screens.left)] },
  iTerm2: { operations: [fullscreenOn(screens.left)] },
  "Google Chrome": { operations: [fullscreenOn(screens.left)] },
  Calendar: { operations: [fullscreenOn(screens.left)] },
  Slack: { operations: [fullscreenOn(screens.left)] },
})

slate.bind("0:ctrl", slate.operation("layout", { name: "threeMonitors" }));
slate.bind("9:ctrl", slate.operation("layout", { name: "justTheMac" }));

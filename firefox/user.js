// DNS
user_pref("network.trr.uri", "https://xbox-dns.ru/dns-query");
user_pref("network.trr.mode", 2);

// Network
user_pref("network.prefetch-next", false);
user_pref("network.http.max-persistent-connections-per-server", 10);
user_pref("network.dns.disablePrefetch", true);

// Interface
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.startup.homepage_override.mstone", "ignore"); // remove "What's New" after updates
user_pref("browser.preferences.moreFromMozilla", false); // remove "More from Mozilla" from settings.
user_pref("browser.shell.checkDefaultBrowser", false); // do not ask about the default browser
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false); // Pocket recommendations
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false); // FF140+
user_pref("browser.urlbar.trending.featureGate", false); // remove trending queries from the address bar.
user_pref("browser.urlbar.suggest.engines", false); // remove search engine switch prompts

// AI
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ai.control.sidebarChatbot", "blocked");
user_pref("browser.ai.control.default", "blocked");
user_pref("browser.ml.enable", false);
user_pref("browser.ml.linkPreview.enabled", false);
user_pref("browser.ml.chat.menu", false);
user_pref("browser.tabs.groups.smart.enabled", false);

// Privacy & Telemetry
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.usage.uploadEnabled", false);
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.server_owner", "");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("datareporting.healthreport.infoURL", "");
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.policy.firstRunURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.tabs.crashReporting.email", false);
user_pref("browser.tabs.crashReporting.emailMe", false);
user_pref("breakpad.reportURL", "");
user_pref("security.ssl.errorReporting.automatic", false);
user_pref("toolkit.crashreporter.infoURL", "");
user_pref("dom.battery.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true); // modern "Do Not Track" standard

// Graphics
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.compositor", true);
user_pref("media.hardware-video-decoding.force-enabled", true);
user_pref("media.gpu-process-decoder", true);
user_pref("layers.gpu-process.enabled", true);
user_pref("layers.gpu-process.force-enabled", true);

// Annoying
user_pref("browser.uitour.enabled", false); // remove tutorials
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.warnOnQuit", true);

// Pocket
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.api", "");
user_pref("extensions.pocket.site", "");
user_pref("extensions.pocket.oAuthConsumerKey", "");

// Youtube fullscreen
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.timeout", 0);

// Fast work
user_pref("gfx.content.skia-font-cache-size", 32);
// user_pref("dom.ipc.processCount", 8); // Firefox itself chooses the optimal
user_pref("browser.cache.memory.capacity", 262144); // 256 MB of RAM for the cache
user_pref("browser.cache.memory.max_entry_size", 51200); // max 50MB per element
user_pref("browser.sessionhistory.max_total_viewers", 3); // number of back/forward pages to remember

// Scrolling
user_pref("apz.overscroll.enabled", true); // "bounce" effect when scrolling to the edge of the page
user_pref("general.smoothScroll", true); // enable smooth scrolling
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12); // max. interval between ticks for "continuous" scrolling, the lower, the more responsive
user_pref("general.smoothScroll.msdPhysics.enabled", true); // physical scroll model (spring/inertia) instead of linear
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600); // spring stiffness at the start of movement, higher = sharper start
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 650); // spring stiffness during movement, higher = less inertia
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25); // minimum interval for the braking phase
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", "2"); // threshold for transition to the inhibition phase
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250); // spring stiffness during braking, lower = smoother stop
user_pref("general.smoothScroll.currentVelocityWeighting", "1"); // weight of current velocity upon a new impulse, 1 = velocities add up (inertia accumulates)
user_pref("general.smoothScroll.stopDecelerationWeighting", "1"); // how abruptly speed drops when stopping, 1 = natural deceleration
user_pref("mousewheel.default.delta_multiplier_y", 300); // vertical scroll wheel step multiplier, higher = faster scrolling

// Mini things
user_pref("findbar.highlightAll", true); // highlight all matches when searching the page
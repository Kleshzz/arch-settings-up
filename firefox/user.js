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
user_pref("browser.startup.homepage_override.mstone", "ignore"); // убирает "что нового" после обновлений
user_pref("browser.preferences.moreFromMozilla", false); // убирает "Больше от Mozilla" в настройках
user_pref("browser.shell.checkDefaultBrowser", false); // не спрашивать про дефолтный браузер
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false); // рекомендации Pocket
user_pref("browser.newtabpage.activity-stream.showSponsoredCheckboxes", false); // FF140+
user_pref("browser.urlbar.trending.featureGate", false); // убрать трендовые запросы в адресной строке
user_pref("browser.urlbar.suggest.engines", false); // убрать подсказки смены поисковика

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
user_pref("privacy.globalprivacycontrol.enabled", true); // современный стандарт "не отслеживать"

// Graphics
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.compositor", true);
user_pref("media.hardware-video-decoding.force-enabled", true);
user_pref("media.gpu-process-decoder", true);
user_pref("layers.gpu-process.enabled", true);
user_pref("layers.gpu-process.force-enabled", true);

// Annoying
user_pref("browser.uitour.enabled", false); // туториалы
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
// user_pref("dom.ipc.processCount", 8); // firefox сам выбирает оптимал
user_pref("browser.cache.memory.capacity", 262144); // 256MB под кеш в RAM
user_pref("browser.cache.memory.max_entry_size", 51200); // макс 50MB на элемент
user_pref("browser.sessionhistory.max_total_viewers", 3); // кол-во запоминаний страниц назад - вперед

// Scrolling
user_pref("apz.overscroll.enabled", true); // эффект "отскока" при прокрутке до края страницы
user_pref("general.smoothScroll", true); // включить плавную прокрутку
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12); // макс. интервал между тиками для "непрерывного" скролла — чем меньше, тем отзывчивее
user_pref("general.smoothScroll.msdPhysics.enabled", true); // физическая модель скролла (пружина/инерция) вместо линейной
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600); // жёсткость пружины в начале движения — выше = резче старт
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 650); // жёсткость пружины во время движения — выше = меньше инерции
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25); // минимальный интервал для фазы торможения
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", "2"); // порог перехода в фазу торможения
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250); // жёсткость пружины при торможении — ниже = плавнее остановка
user_pref("general.smoothScroll.currentVelocityWeighting", "1"); // вес текущей скорости при новом импульсе — 1 = скорости складываются (накапливается инерция)
user_pref("general.smoothScroll.stopDecelerationWeighting", "1"); // насколько резко гасится скорость при остановке — 1 = естественное затухание
user_pref("mousewheel.default.delta_multiplier_y", 300); // множитель шага колёсика по вертикали — выше = быстрее скроллишь

// Mini things
user_pref("findbar.highlightAll", true); // подсвечивать все совпадения при поиске по странице
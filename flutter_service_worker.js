'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "6d6d4388594073e6d34e5a785aa7a21a",
"version.json": "4d5766028e6f3c65b14ff6c92e24e294",
"index.html": "46d49a5f040ead3a031ebd09375f9b1c",
"/": "46d49a5f040ead3a031ebd09375f9b1c",
"main.dart.js": "5f0600bd82b7cdeac06b68460d7f5462",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon2.png": "5dcef449791fa27946b3d35ad8803796",
"favicon1.png": "7e4640e8ffd50b4accbb77aaf65bf3b6",
"favicon.png": "8a74c27dad0a461a95ccd08940f9f89e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "957cee9b9df1a315410ecfea92537801",
"assets/AssetManifest.json": "3351cb814d1e6a9b14420f54f3548b77",
"assets/NOTICES": "5a599667dc9fc8cf2a17943ce1c9e66c",
"assets/FontManifest.json": "c05a821498a83361838c1f97adf13603",
"assets/AssetManifest.bin.json": "264bee02129dc46adaecb05c676c1663",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "ba4b1b5525dc84c2dd620e3caab60ef8",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/service_detail/ranking.png": "709d6485126191013e65aa4092102fa8",
"assets/assets/service_detail/ai_chat.png": "3f50755de820a9810c2361aa4bf6dfb9",
"assets/assets/service_detail/event2.png": "bb80456281fe09b59cea4ab055fa60fb",
"assets/assets/service_detail/event1.png": "fa5a07e75ed82751b23c5cc8468beba0",
"assets/assets/service_detail/feedback3.png": "114d795b42bcaa288e37afc385fa9ef9",
"assets/assets/service_detail/group1.png": "9997c2a42bb5f42b20e2c7f900205659",
"assets/assets/service_detail/feedback2.png": "af949267c6bd4656750cb220b51ee185",
"assets/assets/service_detail/admin.png": "860fce10f8a824606a18065b85a9a4c7",
"assets/assets/service_detail/group2.png": "2b976f052a4ab5ee4884ec0e8be8999f",
"assets/assets/service_detail/feedback1.png": "b7e29e1c9582eecd923a569c565c0e4e",
"assets/assets/service_detail/feedback4.png": "845143c19fbef35f764f65a298f08571",
"assets/assets/service_intro/diary.jpg": "1d8ef22ec9afde2119149ca11cb333ff",
"assets/assets/service_intro/business.jpg": "f9289f84a9087523e044820741b1ae8d",
"assets/assets/service_intro/aichat.jpg": "a5c3d47d4cb8350a38ad1b0006782645",
"assets/assets/today_diary/4.png": "2e4c722fb99b94913798c8b29e5bc9aa",
"assets/assets/today_diary/2.png": "642247a9a0b398bee80e9a6261b0f99f",
"assets/assets/today_diary/3.png": "0556d88bd69584f4f37b5b3592210d72",
"assets/assets/today_diary/1.png": "74e1c5d439975c348aaddba4d17905e7",
"assets/assets/config/dotenv": "7b955024d088e6e5136d52d1d73ce536",
"assets/assets/icons/icon_line.png": "8a74c27dad0a461a95ccd08940f9f89e",
"assets/assets/icons/logo1.png": "7e4640e8ffd50b4accbb77aaf65bf3b6",
"assets/assets/icons/logo3.png": "b04bc08a7e421ced76d0e08936326fa3",
"assets/assets/icons/logo2.png": "2b902ada122cc9556cc152d7a0876226",
"assets/assets/icons/icon_1024.png": "dfb9749c44dc10fd0c8ae279ffd0e90c",
"assets/assets/main/main_phone2.png": "5fa95dad13930ac1ad5cc43219b7bcc1",
"assets/assets/main/main_phone1.png": "ed07008b74e08cbccf38cf48d4006949",
"assets/assets/main/main_phone.png": "338feb09e51aa69c701b3911341bb502",
"assets/assets/main/jp_news.png": "45312ccae51537c09eb27fca7557fa81",
"assets/assets/main/contract.jpg": "85900389e2a462cffa3479dd9032771f",
"assets/assets/fonts/NanumSquareNeoOTF-Eb.otf": "669013195bb11b943952ac23bae56070",
"assets/assets/fonts/NanumSquareNeoOTF-Hv.otf": "facd5b49ad23a067a6e894ac983a0405",
"assets/assets/fonts/NanumSquareNeoOTF-Bd.otf": "ac2c6dd4698f65fb1e799efc81b8d77a",
"assets/assets/fonts/NanumSquareNeoOTF-Lt.otf": "09cca6769e48ef5564154dbfca1a746d",
"assets/assets/fonts/NanumSquareNeoOTF-Rg.otf": "4ba733bc5941db853a333f11ee65ba01",
"assets/assets/app_intro/brain.png": "f31d62c05cf8d3511d36ce032fa2cbbb",
"assets/assets/app_intro/thanksful.png": "47f49cb637fdfb0d64b6b56283d7653e",
"assets/assets/app_intro/bulb.png": "be337d2a4c6646b477926887c520b08d",
"assets/assets/app_intro/activity.png": "24fea87826d8d89233e15e4de0710985",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

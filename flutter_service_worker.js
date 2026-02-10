'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e9b83e464e34979c846df39bd2da28c6",
"version.json": "fa987cde32965dd876d478794ac2747b",
"index.html": "4928f7d784c7de13d7d124a0e13975cc",
"/": "4928f7d784c7de13d7d124a0e13975cc",
"main.dart.js": "ac8498ef464825edfa56a6b7ac084fd0",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ab1d7eba7bba91a1f13e79f0a19914a8",
"assets/NOTICES": "04bf3fa412d3c428898eeadda48c71e5",
"assets/FontManifest.json": "23c089f16f0275e999f87deeeab6d169",
"assets/AssetManifest.bin.json": "b4924267917b8a048df65202651e116c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "e4d705e1faecd9086819f6b70859bc6f",
"assets/fonts/MaterialIcons-Regular.otf": "ed76cc61f6a24bec83b469d9fc7a8c5e",
"assets/assets/jsons/countries_list.json": "82c54bfeba5508956244f3373cbdaefd",
"assets/assets/images/orion.png": "e4c49dc46f9ef0c889e30c91239d782d",
"assets/assets/images/imagine.png": "6af6c977634ca9b72c78600e386f9bce",
"assets/assets/images/catg_food.png": "a0f6b4de374e0216b18fec422051e8b9",
"assets/assets/images/soul_store.png": "10a9864744cb83d39651198b3c6204ab",
"assets/assets/images/lg.png": "93565bc677931410dcc64814e667ee4b",
"assets/assets/images/banner.png": "8287627de40c0b33a91a4d7743f280ca",
"assets/assets/images/onboard-money.png": "26b78333c28ca47efa96273c18c136fd",
"assets/assets/images/onboard-shop.png": "ecea79bf0a7b0f044c355027aaec03c8",
"assets/assets/images/samsung.png": "acf5e9c246652b1392444ff865d8814c",
"assets/assets/images/westside.png": "a1d5eb8e372bef7eed4bf0aef2d47625",
"assets/assets/images/hm.png": "eddd5b77671881f7058b86332cb28afa",
"assets/assets/images/onboard-mobile.png": "0683b1fbcf33224aa29495cee03e5ad0",
"assets/assets/images/apple.png": "54c4ae6f3c4e1c5f6756f0a5697de18f",
"assets/assets/images/login-background.png": "20d6251ff5e38735aa2d30f77c0bee55",
"assets/assets/images/iphone.png": "f4b18c13516fcb13c5793b408bfa7b47",
"assets/assets/images/catg_games.png": "010ed27304fbf4a91ba7ad52a769f453",
"assets/assets/images/console.png": "d95f3f590c604700031cee98499032e0",
"assets/assets/images/logo.png": "175e7674c9a86771a9eef8a17642cee6",
"assets/assets/images/google_logo.png": "4180b6bf10302fd936c24b55374a3373",
"assets/assets/images/lifestyle.png": "bd7a029782ae57db847c879bf63a26e6",
"assets/assets/images/soulestore.png": "1ec0977d02603a9b0cd5172787d7fa98",
"assets/assets/images/kitchen.png": "5c2b5c2ffa40f1fbc91b950939bc85bd",
"assets/assets/images/one_plus.png": "8515be82eef5a4d10c291e74d65c879f",
"assets/assets/images/Screenshot%25202025-10-25%2520at%25203.13.31%25E2%2580%25AFPM.png": "dfeeb2027d0ce2c4a46d7ae48a690508",
"assets/assets/images/whatsapp.png": "3839f636240c2d418aa660ffc8656859",
"assets/assets/images/catg_fashion.png": "470ead4b073b8b4e8f332f8184b465d2",
"assets/assets/images/saas-logo.png": "50f5e03a16435f49d6c0c04e1c1592de",
"assets/assets/images/croma.png": "a634df272b06d4cb942ac048a45e0e2d",
"assets/assets/images/sony.png": "e564e108d238d4edad515545563ced63",
"assets/assets/images/adidas.png": "f42c534734bd2d5f7a77fbd4d1468df5",
"assets/assets/icons/eye-close.png": "f60f81eab5ed925299ec241834238b95",
"assets/assets/icons/eye-open.png": "2aad1919710c441d05658b707dbedb46",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
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

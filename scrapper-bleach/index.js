var request = require('request');
var cheerio = require('cheerio');
var fs = require('fs');
var archiver = require('archiver');
var status = require('node-status');

var baseUrl = 'http://www.bleach-mx.net/lecture-en-ligne/';
var urls = [],
    max,
    progression;


function compress(name, cb) {
  var zipName = name + '.zip',
      output = fs.createWriteStream(zipName),
      archive = archiver('zip');

  output.on('close', function() {
      console.log('[Zip] Production:  archiver has been finalized and the output file descriptor has closed.');
  });
  archive.on('error', function(err) {
      throw err;
  });
  archive.pipe(output);
  archive.bulk([{ expand: true, cwd: 'data/', src: ['**'] }]);

  archive.finalize(cb);
}


function getChapter(url, cb) {
  request(baseUrl + url, function (error, response, html) {
    if (!error && response.statusCode == 200) {
      var $ = cheerio.load(html);

      if('Bleach' === url) {
        max = $('select[name="page"]').eq(0).find('option').length -1;
        progression = status.addItem('urls', {
          type: ['bar','percentage'],
          max: max
        });
        // Start the status-bar
        status.start();
      }

      urls.push($('[src^="mangas/Bleach/6"]').attr('src'));
      var nextUrl = $('[src="themes/default/next.png"]').parent('a').attr('href');

      if(nextUrl) {
        progression.inc(1);
        getChapter($('[src="themes/default/next.png"]').parent('a').attr('href'), cb);
      }else {
        cb(urls);
      }
    }
  });
}

getChapter('Bleach', function (data) {
  status.stop();

  var progress = require('node-status');
  var progression2 = status.addItem('downladed', {
    type: ['bar','percentage'],
    max: max
  });
  // Start the status-bar
  progress.start();

  fs.mkdirSync('./data/' + urls[0].split('/')[2]);

  urls.forEach(function (url, i) {
    console.log('Downloaded ' + url);
    request(baseUrl + url)
      .on('response', function (res) {
        progression2.inc(1);
        res.pipe(fs.createWriteStream('./data/' + url.split('/')[2] + '/' + url.split('/')[3].replace("'",'')));

        if(i === (urls.length -1)) {
          progress.stop();

          compress('[BMX] Bleach Chapitre ' + urls[0].split('/')[2].match(/^\d+/i)[0],function() {
              console.log('Chapitre downladed and zipped');
          });
        }
      });
  });
});

angular.module('myFilter', [])
    .filter('truncate', function () {
      return function (text, length, end) {
        if (isNaN(length))
            length = 60;
        if (end === undefined)
            end = "...";
        if (text.length <= length || text.length - end.length <= length) {
            return text;
        }
        else {
            return String(text).substring(0, length-end.length) + end;
        }
      };
    });
